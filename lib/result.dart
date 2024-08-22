import 'package:flutter/material.dart';

String data="";

class BMIResult extends StatelessWidget{
  const BMIResult({super.key, required this.bmi});
   final double bmi;
  void  getBMICategory(double bmi, String gender) {
    if (bmi < 18.5) {
      data='Underweight';
    } else if (bmi < 24.9) {
      data= 'Normal weight';
    } else if (bmi < 29.9) {
      data= 'Overweight';
    } else {
      data= 'Obesity';
    }
  }

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
             padding: const EdgeInsets.all(150),
             decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(width: 25,color: Colors.red),),
             child:  Text(" $bmi",style: const TextStyle(fontSize: 25,color: Colors.lightGreen),)),
           Text(data!),
           TextButton(onPressed: (){ Navigator.pop(context);}, child: const Text("Recheck BMI"))
         ],
       ),
     ),
   );
  }
}