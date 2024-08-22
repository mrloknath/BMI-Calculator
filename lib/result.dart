import 'package:flutter/material.dart';



class BMIResult extends StatelessWidget{
  BMIResult({super.key, required this.bmi, required this.data});
   final double bmi;
    String data;

   void  getBMICategory(double bmi, String gender) {
     // https://chatgpt.com/share/27f04f17-aa0a-4b4d-9acf-a2311fa4bd5e

    if (bmi < 18.5) {
      data=' Your Body Mass Index (B.M.I.) is $bmi that means You are Underweight';
    } else if (bmi < 24.9) {
      data= ' Your Body Mass Index (B.M.I.) is $bmi that means You are Normal weight';
    } else if (bmi < 29.9) {
      data= 'Your Body Mass Index (B.M.I.) is $bmi that means You are Overweight';
    } else {
      data= 'Your Body Mass Index (B.M.I.) is $bmi that means You are Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    getBMICategory(bmi, data);
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
           Text(data),
           TextButton(onPressed: (){ Navigator.pop(context);}, child: const Text("Recheck BMI"))
         ],
       ),
     ),
   );
  }
}