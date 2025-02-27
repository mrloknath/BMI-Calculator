import 'package:bmi_calculte/provider/provider_age.dart';
import 'package:bmi_calculte/provider/provider_height.dart';
import 'package:bmi_calculte/provider/provider_male_female.dart';
import 'package:bmi_calculte/provider/provider_weight.dart';
import 'package:bmi_calculte/screens/splash_screen.dart';
import 'package:bmi_calculte/widget/mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderMaleFemale()),
        ChangeNotifierProvider(create: (context) => ProviderHeight()),
        ChangeNotifierProvider(create: (context) => ProviderWeight()),
        ChangeNotifierProvider(create: (context) => ProviderAge()),
      ],
      child:const MyApp()
    )
  );
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

