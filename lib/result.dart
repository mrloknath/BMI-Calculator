import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget{
  BMIResult({super.key, required this.bmi});
   double bmi=-1;

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar: AppBar(
       title: TextButton(
           onPressed: (){ Navigator.pop(context);}, child: const Text("Back"),
           ),
     ),
     body: Center(
       child: Text("Result: $bmi"),
     ),
   );
  }
}