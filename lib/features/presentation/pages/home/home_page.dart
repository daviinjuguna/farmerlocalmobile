import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:farmerlocalmobile/core/routes/app_router.gr.dart';
import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/user/user_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/watch_breeder/watch_breeder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _userBloc = getIt<UserBloc>();
  late final _watch = getIt<WatchBreederBloc>();
  // late final
  String _name = "";
  @override
  void initState() {
    super.initState();
    _userBloc.add(UserGetEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.close();
    _watch.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _userBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener(
            listener: (context, UserState state) {
              if (state is UserLoading) {
                _name = "loading";
              }
              if (state is UserSuccess) {
                _name = state.user.name;
              }
            },
            bloc: _userBloc,
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Text(
                  _name,
                  style: TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          drawer: Drawer(),
          body: Provider<WatchBreederBloc>(
            create: (_) => _watch,
            child: Container(
              child: StreamBuilder<BreedersResponse>(
                stream: _watch.subJect.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.error != null &&
                        snapshot.data!.error!.length > 0) {
                      return Text("Error Msee");
                    }
                    if (snapshot.data!.breeders.isEmpty) {
                      return Container();
                    }
                    return ListView.separated(
                      separatorBuilder: (c, i) => Divider(),
                      itemCount: snapshot.data!.breeders.length,
                      itemBuilder: (context, index) {
                        final _breeder = snapshot.data!.breeders[index];
                        return ListTile(
                          onTap: () {},
                          onLongPress: () => showDialog(
                            context: context,
                            builder: (builder) => AlertDialog(
                              title: Text("DELETE"),
                              content: Text("Are you sure you want to delete?"),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(null),
                                  child: Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.4,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text(
                                    "DELETE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.4,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ).then((value) {
                            if (value != null && value) {
                              //!DELETE HERE
                            } else {
                              print("SOMETIMES YOU GOTTA LOSE SOMEBODY");
                            }
                          }).catchError((e, s) {
                            print("ERROR DELETE: $e,$s");
                          }),
                          isThreeLine: true,
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: FileImage(
                              File(_breeder.image!),
                            ),
                          ),
                          title: Text(_breeder.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text((_breeder.gender ? "Buck" : "Doe") +
                                  " (Buck/Doe)"),
                              Text(
                                  "${_breeder.weight.toStringAsFixed(1)} (kg)"),
                              Text("${_breeder.age} (months)")
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error Msee");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => AutoRouter.of(context).push(AddBreederWidget()),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
