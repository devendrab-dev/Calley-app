import 'package:calley/core/widgets/card.dart';
import 'package:calley/core/widgets/app_button.dart';
import 'package:calley/core/widgets/scaffold_message.dart';
import 'package:calley/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                message(context, state.message, true);
                context.read<AuthBloc>().add(OtpRequest(email.text.trim()));
                GoRouter.of(context).push('/otp', extra: email);
              } else if (state is SignUpFailed) {
                message(context, state.message, true);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/Logo.png"),
                MyCard(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Welcome!",
                          style: TextTheme.of(context).headlineLarge,
                        ),
                        Text(
                          "Please register to continue",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 18),
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            hintText: "Name",
                            suffixIcon: Icon(Icons.person_outline),
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
                        SizedBox(height: 12),
                        Container(
                          padding: EdgeInsets.all(12),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/image 52.png"),
                                  SizedBox(width: 10),
                                  Text("+91"),
                                ],
                              ),
                              Image.asset("assets/Icons/image 50.png"),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Mobile number",
                            suffixIcon: Icon(Icons.phone_outlined),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can't be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Checkbox(
                              value: check,
                              onChanged: (value) {
                                setState(() {
                                  check = !check;
                                });
                              },
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'I agree to the ',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Terms & Conditions',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.go("/login");
                                  },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        AppButton(
                          title: "Sign Up",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignupRequested(
                                  name.text.trim(),
                                  email.text.trim(),
                                  password.text.trim(),
                                ),
                              );
                            }
                          },
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
