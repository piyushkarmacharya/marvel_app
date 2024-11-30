import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/constants/image_path.dart';
import 'package:marvel_app/pages/signup_page/signup_page.dart';
import 'package:marvel_app/screen_size.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login-page";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Color buttonBgColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.08 * ScreenSize.width,
            0.085 * ScreenSize.height, 0.08 * ScreenSize.width, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImagePath.logo),
              SizedBox(
                height: 0.06 * ScreenSize.height,
              ),
              Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formState,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Email ID";
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)) {
                            return "Invalid email";
                          }
                          return null;
                        },
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.9)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 0.02 * ScreenSize.height),
                            hintText: "Enter your Email ID",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 0.02 * ScreenSize.height,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Password";
                          } else if (value.length < 6) {
                            return "Password is short";
                          }
                          return null;
                        },
                        obscureText: !_showPassword,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.9)),
                            suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Text(_showPassword ? "Hide" : "Show")),
                            suffixStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 0.02 * ScreenSize.height),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      SizedBox(
                        height: 0.03 * ScreenSize.height,
                      ),
                      SizedBox(
                        height: 0.0625 * ScreenSize.height,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: primaryColor, width: 3)),
                          height: 0.0625 * ScreenSize.height,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonBgColor,
                            ),
                            onPressed: () {
                              if (formState.currentState!.validate()) {
                                setState(() {
                                  buttonBgColor =
                                      Theme.of(context).primaryColor;
                                });
                              } else {
                                setState(() {
                                  buttonBgColor = Colors.black;
                                });
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18.38,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.02 * ScreenSize.height,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.7)),
                          )),
                      SizedBox(
                        height: 0.05 * ScreenSize.height,
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 0.02 * ScreenSize.height,
                      ),
                      const Text(
                        "Continue With",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 0.02 * ScreenSize.height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 0.4 * ScreenSize.width,
                              child: SvgPicture.asset(ImagePath.facebook)),
                          SizedBox(
                              width: 0.4 * ScreenSize.width,
                              child: SvgPicture.asset(ImagePath.google)),
                        ],
                      ),
                      SizedBox(
                        height: 0.04 * ScreenSize.height,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "Dont't have an account?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white.withOpacity(0.5))),
                          TextSpan(
                              text: " Signup",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushNamed(SignupPage.routeName);
                                },
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).primaryColor))
                        ]),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
