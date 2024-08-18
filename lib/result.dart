import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget{
  BMIResult({super.key, required this.bmi});
   double bmi=-1;

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar: AppBar(
       title: TextButton.icon(
           onPressed: (){ Navigator.pop(context);},
           label: const Text("Back")),
     ),
     body: Center(
       child: Text("Result: $bmi"),
     ),
   );
  }
}