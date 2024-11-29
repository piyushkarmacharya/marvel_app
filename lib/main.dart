import "package:flutter/material.dart";
import "package:marvel_app/homepage.dart";
import "package:marvel_app/pages/splash_screen/splash_screen.dart";
import "package:marvel_app/pages/welcome_screen/welcome_screen.dart";
import "package:marvel_app/screen_size.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().initSize(context);
    return MaterialApp(
      title: "Marvel App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Inter",
          scaffoldBackgroundColor: const Color(0xFF1E1E1E),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: const Color(0xFFED1B24))),
          colorScheme: const ColorScheme.dark(
            surface: Color(0xFFED1B24),
          )),
      initialRoute: SplashScreen.routeName,
      routes: {
        Homepage.routeName: (context) => const Homepage(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
      },
    );
  }
}
