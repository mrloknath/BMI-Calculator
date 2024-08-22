import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget{
  const BMIResult({super.key, required this.bmi});
   final double bmi;


  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar: AppBar(
       title: TextButton(
           onPressed: (){ Navigator.pop(context);}, child: const Text("Back"),),
     ),
     body: Center(
       child: Column(
         children: [
           Container(
             //color: Colors.lightGreen,
             padding: EdgeInsets.all(150),
             decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(width: 25,color: Colors.red),),
             child:  Text("Result: $bmi",)),

         ],
       ),
     ),
   );
  }
}