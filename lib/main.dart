import "package:flutter/material.dart";
import "package:marvel_app/homepage.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Inter",
          scaffoldBackgroundColor: const Color(0xFF1E1E1E),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFED1B24))),
          colorScheme: const ColorScheme.dark(
            surface: Color(0xFFED1B24),
          )),
      initialRoute: Homepage.routeName,
      routes: {
        Homepage.routeName: (context) => const Homepage(),
      },
    );
  }
}
