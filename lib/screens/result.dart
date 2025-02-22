import 'package:flutter/material.dart';
import '../widget/floating_button_fab.dart';

String data='normal';
Color _color=Colors.transparent;

class BMIResult extends StatelessWidget{
  const BMIResult({super.key, required this.bmi, required this.maleFemale,required this.height,required this.weight,required this.age});
   final double bmi;
   final String maleFemale;
   final int age;
   final int height;
   final int weight;




   void  getBMICategory(double bmi, String gender) {

    if (bmi < 18.5) {
      data='underweight';
      _color=Colors.blue;
    } else if (bmi < 24.9) {
      data= 'normal';
      _color=Colors.green;
    } else if (bmi < 29.9) {
      data= 'overweight';
      _color=Colors.yellow.shade800;
    } else {
      data= 'obesity';
      _color=Colors.red;
    }
  }


  @override
  Widget build(BuildContext context) {
    getBMICategory(bmi, data);
   return  Scaffold(
     backgroundColor:_color.withAlpha(100),
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       centerTitle: true,
       title: const Text("Result"),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [

           Flexible(
             flex: 3,
             child: CircleAvatar(
               backgroundColor: _color,
               minRadius: 150,
               child: Expanded(
                 child: Container(
                   width: double.infinity,
                     height: double.infinity,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       gradient: RadialGradient(
                         colors: [ Colors.white,_color],
                         center: Alignment.center, // Centered gradient
                         radius: 0.6, // Controls spread of the gradient
                       ),
                     ),
                     child: Center(child: Text("  ${bmi.toStringAsFixed(2)} ",style: TextStyle(fontSize: 50,color: _color),))),
               ),
             ),
           ),

           Flexible(
             flex: 4,
               child: Image.asset("assets/$maleFemale/${maleFemale}_$data.png")),

           Flexible(
             flex: 2,
             child: Container(
                 padding: const EdgeInsets.all(20),
                 margin: const EdgeInsets.only(left: 50,right: 50),
                 decoration: BoxDecoration(//color: Colors.transparent.withAlpha(20),
                     gradient: LinearGradient(
                       colors: [Colors.yellowAccent.shade200,_color],
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                     ),
                     borderRadius: BorderRadius.circular(20)),
                 child: Text("B.M.I. : ${bmi.toStringAsFixed(2)}\nAge : $age \nHeight : $height\nWeight : $weight\nHealth : $data ",
                 style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,
                 )),
           ),



           // Container(
           //
           //     height: 50,
           //     margin: const EdgeInsets.only(left: 50,right: 50),
           //     child: ElevatedButton.icon(
           //         onPressed: (){ },
           //
           //         style: ElevatedButton.styleFrom(
           //           backgroundColor: Colors.white,
           //           elevation: 20,
           //         ),
           //         icon: Icon(Icons.accessibility,color: _color,size: 30,),
           //         label: Text("Healthy Tips" ,style: TextStyle(fontSize: 20,color: _color),)))


         ],
       ),
     ),



     floatingActionButton: FloatingButtonFab(color: _color,bmi: bmi,),
   );
  }
}