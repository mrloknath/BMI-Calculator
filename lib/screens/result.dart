import 'package:bmi_calculte/provider/provider_age.dart';
import 'package:bmi_calculte/provider/provider_height.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_male_female.dart';
import '../provider/provider_weight.dart';
import '../widget/floating_button_fab.dart';

String data='normal';
Color _color=Colors.transparent;

class BMIResult extends StatelessWidget{
  const BMIResult({super.key, required this.bmi});
   final double bmi;




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

           Flexible(
             flex: 4,
               child: Consumer<ProviderMaleFemale>(
                   builder: (context,value,child){
                   return Image.asset("assets/${context.read<ProviderMaleFemale>().maleFemale}/${context.read<ProviderMaleFemale>().maleFemale}_$data.png");
                    }
                    )
           ),

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
                 child: Text("B.M.I. : ${bmi.toStringAsFixed(2)}\nAge : ${context.read<ProviderAge>().age} \nHeight : ${context.read<ProviderHeight>().height}\nWeight : ${context.read<ProviderWeight>().weight}\nHealth : $data ",
                 style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,
                 )),
           ),



         ],
       ),
     ),



     floatingActionButton: FloatingButtonFab(color: _color,bmi: bmi,),
   );
  }
}