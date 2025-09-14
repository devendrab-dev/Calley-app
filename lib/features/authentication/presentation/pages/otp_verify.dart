import 'package:calley/core/widgets/card.dart';
import 'package:calley/core/widgets/app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Logo.png"),
            Expanded(
              child: MyCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 16,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Welcome!",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Please ensure that the email id mentioned is valid as we have sent an OTP to your email.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              6,
                              (index) => SizedBox(
                                height: 54,
                                width: 42,
                                child: TextFormField(
                                  showCursor: false,
                                  cursorWidth: 0,
                                  cursorHeight: 0,
                                  controller: _otpControllers[index],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: _hasError
                                            ? Colors.red
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: _hasError
                                            ? Colors.red
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: _hasError
                                            ? Colors.red
                                            : Colors.blue,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty && index < 5) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (_hasError)
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Please enter all 6 digits",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          const SizedBox(height: 20),
                          const Text("+91 7676286822?"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Didn\'t receive OTP code? ',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Resend OTP',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          AppButton(
                            title: "Verify",
                            onPressed: () {
                              final otp = _otpControllers
                                  .map((c) => c.text)
                                  .join();

                              if (otp.length < 6 || otp.contains('')) {
                                setState(() {
                                  _hasError = true;
                                });
                              } else {
                                setState(() {
                                  _hasError = false;
                                });
                                debugPrint("Entered OTP: $otp");
                                context.go("/landing");
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
          ],
        ),
      ),
    );
  }
}
