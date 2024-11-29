import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/pages/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color bgColor = const Color(0xFFED1B24);
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        bgColor = const Color(0xFF1E1E1E);
      });
    });
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(child: SvgPicture.asset("assets/logo/Marvel-Logo.svg")),
    );
  }
}
