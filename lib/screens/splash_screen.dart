import 'package:zen_health/screens/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:zen_health/constants/color_constants.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  double _scale = 0.85;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
          _scale = 1.0;
        });
      }
    });
    Timer(const Duration(seconds: 3), (){
      if (mounted) {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => const HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgLightGreen, AppColors.bgGreenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInOut,
            opacity: _opacity,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOutBack,
              scale: _scale,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightGreen.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/splashscreen.png',
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.health_and_safety,
                        size: 120,
                        color: AppColors.lightGreen,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "ZEN HEALTH",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      color: AppColors.textDarkGreen,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your Personal BMI Companion",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2,
                      color: AppColors.lightGreen.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
