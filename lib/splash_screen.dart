import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

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
              builder:(context) => const HomeScreen()));
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