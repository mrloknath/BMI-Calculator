import 'package:bmi_calculte/provider/provider_height.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Height extends StatelessWidget{
  const Height({super.key,required this.min,required this.max});
  final int  min,max;
  // Color iconText=Colors.green;
  // Color buttonBackColor=Colors.lightGreen;
  //final int height;


  @override
  Widget build(BuildContext context) {
    Color iconText=Colors.green;
    Color buttonBackColor=Colors.lightGreen;
    return Container(
      height: 430,
      width: 125,
      //color: Colors.orangeAccent,
      decoration:  BoxDecoration( borderRadius: BorderRadius.circular(20), color: buttonBackColor,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("HEIGHT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          
          
          Text("${context.watch<ProviderHeight>().height} cm",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          ),

          
          SizedBox(
            height: 250,
            child: RotatedBox(
              quarterTurns: 3,
              child: Consumer<ProviderHeight>(
                builder: (BuildContext context, value, Widget? child) {
                  return Slider(
                      label: "${context.watch<ProviderHeight>().height}",
                      activeColor: Colors.green,
                      inactiveColor: Colors.green.shade100,

                      value: context.read<ProviderHeight>().height.toDouble(),
                      min: min.toDouble(),
                      max:max.toDouble(),
                      divisions: 300,

                      onChanged: (newValue)=>context.read<ProviderHeight>().changeHeight(newValue.toInt()),
                      );
                }
                )

            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: ()=> context.read<ProviderHeight>().decrementHeight(),
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: Icon(Icons.remove,color: iconText,)
              ),

              TextButton(
                onPressed: ()=> context.read<ProviderHeight>().incrementHeight(),
                style: TextButton.styleFrom( backgroundColor: Colors.white,),
                child: Icon(Icons.add,color: iconText)
              )
            ],
          ),
        ],
      ),
    );
  }

}

