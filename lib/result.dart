import 'package:flutter/material.dart';


class BMIResult extends StatelessWidget{
  BMIResult({super.key, required this.bmi, required this.data});
   final double bmi;
    String data;
    Color _color=Colors.transparent;


   void  getBMICategory(double bmi, String gender) {
     // https://chatgpt.com/share/27f04f17-aa0a-4b4d-9acf-a2311fa4bd5e

    if (bmi < 18.5) {
      data=' Your Result (B.M.I.) is ${bmi.toStringAsFixed(2)} \n\n You are Underweight';
      _color=Colors.blue;
    } else if (bmi < 24.9) {
      data= ' Your Result (B.M.I.) is  ${bmi.toStringAsFixed(2)} \n\n  You are Normal weight';
      _color=Colors.green;
    } else if (bmi < 29.9) {
      data= 'Your Result (B.M.I.) is  ${bmi.toStringAsFixed(2)} \n\n  You are Overweight';
      _color=Colors.yellow.shade800;
    } else {
      data= 'Your Result (B.M.I.) is ${bmi.toStringAsFixed(2)} \n\n You are Obesity';
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
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [

           CircleAvatar(
             backgroundColor: _color,
             minRadius: 150,
             child: Text("  ${bmi.toStringAsFixed(2)} ",style: const TextStyle(fontSize: 75,color: Colors.white),),
           ),

           Container(
               padding: const EdgeInsets.all(20),
               margin: const EdgeInsets.only(left: 50,right: 50),
               decoration: BoxDecoration(color: Colors.transparent.withAlpha(20),borderRadius: BorderRadius.circular(20)),
               child: Text(data,style: TextStyle(color: _color,fontSize: 15,fontWeight: FontWeight.bold),)),



           Container(

               height: 50,
               margin: const EdgeInsets.only(left: 50,right: 50),
               child: ElevatedButton.icon(
                   onPressed: (){ },

                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.white,
                     elevation: 20,
                   ),
                   icon: Icon(Icons.accessibility,color: _color,size: 30,),
                   label: Text("Healthy Tips" ,style: TextStyle(fontSize: 20,color: _color),)))
         ],
       ),
     ),



     floatingActionButton: FloatingActionButton(
       onPressed: () {

       },
       backgroundColor: Colors.white,
       tooltip: "Tips to healthy",
       mini: true,
       child: Icon(Icons.accessibility),
     ),
   );
  }
}