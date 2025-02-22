import 'package:bmi_calculte/screens/splash_screen.dart';
import 'package:bmi_calculte/widget/mobile.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Mobile(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            shape: CircleBorder(),
            smallSizeConstraints: BoxConstraints.tightFor(width: 40, height: 40, ),
            backgroundColor: Colors.white, // Default FAB color
            // foregroundColor: Colors.white,  // Default icon color
          ),
          useMaterial3: true,
        ),
        home:const SplashScreen()
      ),
    );
  }
}

