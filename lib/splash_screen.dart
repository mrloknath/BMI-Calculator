

import 'dart:async';

import 'package:bmi_calculte/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder:(context) => const MyHomePage(title: "Flutter demo Home page")));
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: double.infinity,
       height: double.infinity,
       color: Colors.white,
       child:  Center(
           child: Image.asset('assets/images/splashscreen.jpg'),
       ),
     ),
   );
  }
}