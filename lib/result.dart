import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget{
  BMIResult({super.key, required this.bmi});
   double bmi=-1;

  @override
  Widget build(BuildContext context) {
   return const Center(
     child: Text("Result"),
   );
  }
}