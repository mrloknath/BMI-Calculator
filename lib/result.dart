import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class BMIResult extends StatelessWidget{
  BMIResult({super.key, required this.bmi, required this.data});
   final double bmi;
    String data;




   void  getBMICategory(double bmi, String gender) {
     // https://chatgpt.com/share/27f04f17-aa0a-4b4d-9acf-a2311fa4bd5e

    if (bmi < 18.5) {
      data=' Your Body Mass Index (B.M.I.) is ${bmi.toStringAsFixed(2)} that means You are Underweight';
    } else if (bmi < 24.9) {
      data= ' Your Body Mass Index (B.M.I.) is  ${bmi.toStringAsFixed(2)} that means You are Normal weight';
    } else if (bmi < 29.9) {
      data= 'Your Body Mass Index (B.M.I.) is  ${bmi.toStringAsFixed(2)} that means You are Overweight';
    } else {
      data= 'Your Body Mass Index (B.M.I.) is  ${bmi.toStringAsFixed(2)} that means You are Obesity.\n\n"Dietary Changes: Focus on a balanced diet with a calorie deficit. Incorporate more fruits, vegetables, whole grains, and lean proteins. Reduce intake of sugary drinks, processed foods, and unhealthy fats.  \n\n Exercise: Aim for at least 150 minutes of moderate-intensity aerobic activity (like brisk walking) per week, along with strength training exercises twice a week.  \n\n Behavioral Strategies: Practice mindful eating, keep a food diary, and manage stress. Seek support from healthcare professionals if needed.     \n\n Medical Support: In some cases, medication or surgery may be recommended by a doctor for significant weight loss. "';
    }
  }

  @override
  Widget build(BuildContext context) {
    getBMICategory(bmi, data);
   return  Scaffold(
     backgroundColor: Colors.lightGreenAccent,
     appBar: AppBar(
       backgroundColor: Colors.transparent,
     ),
     body: Center(
       child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               //color: Colors.lightGreen,
               padding: const EdgeInsets.all(50),
               decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(width: 25,color: Colors.red),),
               child:  Text("  ${bmi.toStringAsFixed(2)} ",style: const TextStyle(fontSize: 100,color: Colors.white),)),
         
         
         
         
             Opacity(
               opacity: 0.8,
               child: Container(
                   padding: EdgeInsets.all(10),
                   margin: const EdgeInsets.all(10),
                   decoration: BoxDecoration(color: Colors.lightGreen,borderRadius: BorderRadius.circular(20)),
                   child: Text(data,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
             ),
         
         
         
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
                     icon: const Icon(Icons.refresh,color: Colors.lightGreen,size: 30,),
                     label: const Text("Recheck BMI" ,style: TextStyle(fontSize: 30,color: Colors.lightGreen),)))
           ],
         ),
       ),
     ),
   );
  }
}