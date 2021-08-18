import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:farmerlocalmobile/core/routes/app_router.gr.dart';
import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/breeders/breeders_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/splash/splash_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/user/user_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/watch_blocs/watch_breeder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _userBloc = getIt<UserBloc>();
  late final _watch = getIt<WatchBreederBloc>();
  late final _breedersBloc = getIt<BreedersBloc>();
  late final _splashBloc = getIt<SplashBloc>();

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
    _splashBloc.close();
    _breedersBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _userBloc),
        BlocProvider(create: (create) => _breedersBloc),
        BlocProvider(create: (create) => _splashBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener(
            listener: (c, SplashState state) {
              if (state is SplashLoggedOut) {
                WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                  AutoRouter.of(context).replace(LoginRoute());
                });
              }
            },
            bloc: _splashBloc,
          ),
          BlocListener<BreedersBloc, BreedersState>(
            listener: (context, state) {
              if (state is BreedersLoading) {
                ScaffoldMessenger.maybeOf(context)
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.blue,
                      behavior: SnackBarBehavior.fixed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      )),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Loading...",
                          ),
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
              }
              if (state is BreedersSuccess) {
                ScaffoldMessenger.maybeOf(context)
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.fixed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      )),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "SUCCESS",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text("Deleted Successfully")
                        ],
                      ),
                    ),
                  );
              }
              if (state is BreedersError) {
                ScaffoldMessenger.maybeOf(context)
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.fixed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      )),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "ERROR",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // SizedBox(height: 3),
                          Text(state.message)
                        ],
                      ),
                    ),
                  );
              }
            },
          ),
          BlocListener(
            listener: (context, UserState state) {
              if (state is UserLoading) {
                _name = "loading";
              }
              if (state is UserSuccess) {
                setState(() {
                  _name = state.user.name;
                });
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
          drawer: Drawer(
            child: Container(
              color: Colors.green,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        "assets/rabbids.jpg",
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${_name.toUpperCase()}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    BlocBuilder<SplashBloc, SplashState>(
                      builder: (context, state) {
                        return MaterialButton(
                          onPressed: () {
                            if (state is SplashLoading) {
                              print("JAMAA TULIA BANNA");
                              return;
                            }
                            showDialog<bool?>(
                              context: context,
                              builder: (builder) => AlertDialog(
                                title: Text("LOGOUT"),
                                content:
                                    Text("Are you sure you want to logout?"),
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
                                      "LOGOUT",
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
                                _splashBloc.add(LogoutEvent());
                              }
                            }).catchError((e, s) {
                              print("LOGOUT ERROR: ,");
                            });
                          },
                          color: Colors.white,
                          child: Text(
                            state is SplashLoading ? "LOGGING OUT" : "LOGOUT",
                            style: TextStyle(color: Colors.green),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            child: StreamBuilder<BreedersResponse>(
              stream: _watch.subJect.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error != null &&
                      snapshot.data!.error!.length > 0) {
                    return Text("Error Msee");
                  }
                  if (snapshot.data!.breeders.isEmpty) {
                    return Center(child: Text("EMPTY LIST"));
                  }
                  return ListView.separated(
                    separatorBuilder: (c, i) => Divider(),
                    itemCount: snapshot.data!.breeders.length,
                    itemBuilder: (context, index) {
                      final _breeder = snapshot.data!.breeders[index];
                      return ListTile(
                        onTap: () => AutoRouter.of(context)
                            .push(DetailsRoute(breeders: _breeder)),
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
                            _breedersBloc
                                .add(DeleteBreederEvent(id: _breeder.id));
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
                            Text("${_breeder.weight.toStringAsFixed(1)} (kg)"),
                            Text("${_breeder.age} (months)")
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () =>
                              AutoRouter.of(context).push(AddBreederWidget(
                            breeders: _breeder,
                          )),
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
          floatingActionButton: FloatingActionButton(
            onPressed: () => AutoRouter.of(context).push(AddBreederWidget()),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
