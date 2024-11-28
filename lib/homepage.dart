import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  static String routeName = "/home-page";
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("marvell"),
    );
  }
}
