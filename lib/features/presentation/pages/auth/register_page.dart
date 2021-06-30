import 'package:auto_route/auto_route.dart';
import 'package:farmerlocalmobile/core/utils/constants.dart';
import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farmerlocalmobile/core/routes/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final _authBloc = getIt<AuthBloc>();
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();
  late final _confirmPasswordController = TextEditingController();
  late final _nameController = TextEditingController();
  late final _formKey = GlobalKey<FormState>();

  //* hiding showing pass
  bool _isHidden = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _authBloc.close();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
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
                        "REGISTER SUCCESS",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text("Login with the registered credentials")
                    ],
                  ),
                ),
              );

            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              AutoRouter.of(context).replace(LoginRoute());
            });
          }
          if (state is AuthError) {
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
                        "REGISTER ERROR",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // SizedBox(height: 3),
                      Text(state.error)
                    ],
                  ),
                ),
              );
          }
          if (state is AuthLoading) {
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
                        "Signing up...",
                      ),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                    ],
                  ),
                ),
              );
          }
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.green,
                  Colors.lightGreenAccent,
                ],
              ),
            ),
            child: ListView(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.5, left: 10.0),
                      child: Container(
                        //color: Colors.green,
                        height: 200,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 60,
                            ),
                            Center(
                              child: Text(
                                'Nyandarua Rabbitries',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 50, right: 50),
                        child: TextFormField(
                          controller: _nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "Name is required";
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            )),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.red,
                              style: BorderStyle.solid,
                            )),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            fillColor: Colors.lightBlueAccent,
                            labelText: 'Farm name',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 50, right: 50),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) {
                            if (!RegExp(EMAIL_REGEX)
                                .hasMatch(value!.trim().toLowerCase()))
                              return "email must be valid";
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            )),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.red,
                              style: BorderStyle.solid,
                            )),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) {
                            if (!RegExp(PASS_REGEX).hasMatch(value!.trim()))
                              return "password must be minimum of 6 alphanumerical";
                          },
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.solid,
                              )),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.red,
                                style: BorderStyle.solid,
                              )),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.solid,
                              )),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isHidden = !_isHidden;
                                  });
                                },
                                icon: Icon(
                                  _isHidden
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 50, right: 50),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) {
                            if (value != _passwordController.text)
                              return "Passwords do not match";
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            )),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.red,
                              style: BorderStyle.solid,
                            )),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            fillColor: Colors.lightBlueAccent,
                            labelText: "Confirm password",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, right: 50, left: 200),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green[300]!,
                                blurRadius:
                                    10.0, // has the effect of softening the shadow
                                spreadRadius:
                                    1.0, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return TextButton(
                                onPressed: state is AuthLoading
                                    ? () {
                                        print("WERE ALL SURVIVING");
                                      }
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          _authBloc.add(AuthRegister(
                                            email: _emailController.text
                                                .trim()
                                                .toLowerCase(),
                                            password:
                                                _passwordController.text.trim(),
                                            name: _nameController.text.trim(),
                                          ));
                                        }
                                      },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.lightGreenAccent,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.lightGreenAccent,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Container(
                    alignment: Alignment.topRight,
                    //color: Colors.red,
                    // height: 20,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Have we met before?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              AutoRouter.of(context).popAndPush(LoginRoute()),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
