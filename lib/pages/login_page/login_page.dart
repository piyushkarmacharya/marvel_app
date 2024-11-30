import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login-page";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Login Page"),
    );
  }
}
