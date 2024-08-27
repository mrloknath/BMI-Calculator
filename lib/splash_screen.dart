import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isDisappearing = false;

  void _snap() {
    setState(() {
      _isDisappearing = true;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), _snap);
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       decoration: const BoxDecoration(
         //color: Colors.green.shade100,
           gradient: LinearGradient(
             colors: [Colors.yellowAccent,Colors.lightGreenAccent],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
           )
       ),
       width: double.infinity,
       height: double.infinity,
       child: Center(
         child: AnimatedContainer(
           duration: const Duration(seconds: 2),
           width: _isDisappearing ? 0.0 : 500.0,
           height: _isDisappearing ? 0.0 : 500.0,
           //color: _isDisappearing?Colors.lightGreen:Colors.lightGreen,
           child: Image.asset('assets/images/splashscreen.png'),
         ),
       ),
     ),
   );
  }
}
