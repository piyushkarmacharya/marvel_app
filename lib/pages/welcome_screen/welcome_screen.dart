import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:marvel_app/constants/image_path.dart";
import "package:marvel_app/pages/login_page/login_page.dart";
import "package:marvel_app/pages/signup_page/signup_page.dart";
import "package:marvel_app/screen_size.dart";

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome-screen";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  bool signup = true;
  List<String> images = [
    ImagePath.rect1,
    ImagePath.rect2,
    ImagePath.rect3,
    ImagePath.rect4,
    ImagePath.rect5,
    ImagePath.rect6,
  ];
  int selected = 0;
  List<Widget> widgets = [
    const Text(
      "All your favourite\nMARVEL Movies & Series\nat one place",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      textAlign: TextAlign.center,
    ),
    const Text(
      "Watch Online\nor\nDownload Offline",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      textAlign: TextAlign.center,
    ),
    const Text(
      "Create profiles for\ndiffrent members &\nget personalised\nrecommendations",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      textAlign: TextAlign.center,
    ),
    const Text(
      "Plans according to your needs at affordable prices",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      textAlign: TextAlign.center,
    ),
    const Text(
      "Let’s Get Started !!!",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      textAlign: TextAlign.center,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (selected > 0) {
          setState(() {
            selected--;
          });
        }
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              SizedBox(
                height: 0.75 * ScreenSize.height,
                width: double.infinity,
                child: Image.asset(
                  images[selected],
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(ImagePath.logo),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.07 * ScreenSize.height),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: selected == index
                                      ? primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 0.42 * ScreenSize.height,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.08 * ScreenSize.width),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (selected == 5)
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: primaryColor, width: 3)),
                              height: 0.0625 * ScreenSize.height,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        signup ? primaryColor : Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      signup = true;
                                      Timer(const Duration(milliseconds: 70),
                                          () {
                                        Navigator.of(context)
                                            .pushNamed(SignupPage.routeName);
                                      });
                                    });
                                  },
                                  child: const Text(
                                    "Signup",
                                    style: TextStyle(
                                        fontSize: 18.38,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
                            ),
                          if (selected == 5)
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 0.04 * ScreenSize.height, 0, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primaryColor, width: 3)),
                                height: 0.0625 * ScreenSize.height,
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: !signup
                                            ? primaryColor
                                            : Colors.black),
                                    onPressed: () {
                                      setState(() {
                                        signup = false;
                                        Timer(const Duration(milliseconds: 70),
                                            () {
                                          Navigator.of(context)
                                              .pushNamed(LoginPage.routeName);
                                        });
                                      });
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 18.38,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          if (selected < 5)
                            SizedBox(
                                height: 0.15 * ScreenSize.height,
                                child: widgets[selected]),
                          if (selected < 5)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.1 * ScreenSize.height),
                              child: SizedBox(
                                height: 0.0625 * ScreenSize.height,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selected < 5) {
                                          selected++;
                                        }
                                      });
                                    },
                                    child: const Text(
                                      "Continue",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.38,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
