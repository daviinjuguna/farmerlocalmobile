import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _userBloc = getIt<UserBloc>();
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
            title: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Text(_name);
              },
            ),
          ),
          drawer: Drawer(),
          body: Text("NYUMBANI"),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
