import 'package:flutter/material.dart';


class BMIResult extends StatelessWidget{
  BMIResult({super.key, required this.bmi, required this.data});
   final double bmi;
    String data;
    Color _color=Colors.transparent;


   void  getBMICategory(double bmi, String gender) {
     // https://chatgpt.com/share/27f04f17-aa0a-4b4d-9acf-a2311fa4bd5e

    if (bmi < 18.5) {
      data=' Your Body Mass Index (B.M.I.) is ${bmi.toStringAsFixed(2)} that means You are Underweight';
      _color=Colors.blue;
    } else if (bmi < 24.9) {
      data= ' Your Body Mass Index (B.M.I.) is  ${bmi.toStringAsFixed(2)} that means You are Normal weight';
      _color=Colors.green;
    } else if (bmi < 29.9) {
      data= 'Your Body Mass Index (B.M.I.) is  ${bmi.toStringAsFixed(2)} that means You are Overweight';
      _color=Colors.yellow.shade800;
    } else {
      data= 'Your Body Mass Index (B.M.I.) is  ${bmi.toStringAsFixed(2)} that means You are Obesity';
      _color=Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    getBMICategory(bmi, data);
   return  Scaffold(
     backgroundColor:_color.withAlpha(100),
     appBar: AppBar(backgroundColor: _color,),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
             //color: Colors.lightGreen,
             padding: const EdgeInsets.all(75),
             decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(width: 25,color: _color),),
             child:  Text("  ${bmi.toStringAsFixed(2)} ",style: const TextStyle(fontSize: 75,color: Colors.white),)),



           Container(
               padding: const EdgeInsets.all(10),
               margin: const EdgeInsets.all(100),
               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
               child: Text(data,style: TextStyle(color: _color,fontSize: 15,fontWeight: FontWeight.bold),)),



           Container(
             width: double.infinity,
               height: 50,
               margin: const EdgeInsets.all(10),
               child: ElevatedButton.icon(
                   onPressed: (){ Navigator.pop(context);},
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                     elevation: 20,
                   ),
                   icon: Icon(Icons.refresh,color: _color,size: 30,),
                   label: Text("Recheck BMI" ,style: TextStyle(fontSize: 30,color: _color),)))
         ],
       ),
     ),
   );
  }
}