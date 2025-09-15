import 'package:calley/core/widgets/card.dart';
import 'package:calley/core/widgets/app_button.dart';
import 'package:calley/core/widgets/scaffold_message.dart';
import 'package:calley/features/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            message(context, "Login Success", false);
            context.go("/landing", extra: state.user);
          } else if (state is LoginFailed) {
            message(context, state.message, true);
          }
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset("assets/images/Logo.png"),
              SizedBox(height: 50),
              Expanded(
                child: MyCard(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Column(
                            children: [
                              Text(
                                "Welcome!",
                                style: TextTheme.of(context).headlineLarge,
                              ),
                              Text(
                                "Please sign-in to continue",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 18),
                              TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Email address",
                                  suffixIcon: Icon(Icons.email_outlined),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field can't be empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field can't be empty";
                                  }
                                  return null;
                                },
                              ),
                              Align(
                                alignment: AlignmentGeometry.bottomRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text("Forgot Password?"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.go("/signup");
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              AppButton(
                                title: "Sign In",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<LoginBloc>(context).add(
                                      LoginRequested(
                                        email.text.trim(),
                                        password.text.trim(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
