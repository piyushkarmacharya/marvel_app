import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/pages/welcome_screen/welcome_screen.dart';
import 'package:marvel_app/screen_size.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        animate = true;
      });
    });
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 1100),
            curve: Curves.bounceOut,
            color: Theme.of(context).primaryColor,
            height: animate ? 86 : ScreenSize.height,
            width: animate ? 189 : ScreenSize.width,
            child:
                Center(child: SvgPicture.asset("assets/logo/Marvel-Logo.svg"))),
      ),
    );
  }
}
