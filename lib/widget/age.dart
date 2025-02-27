import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_age.dart';

class Age extends StatelessWidget{
  const Age({super.key, required this.min,required this.max});
  final int min,max;


  @override
  Widget build(BuildContext context) {
    Color iconText=Colors.green;
    Color buttonBackColor=Colors.lightGreen;
    return Container(
      height: 200,
      width: 125,
      //color: Colors.orangeAccent,
      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20), color: buttonBackColor,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("Age",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text("${context.watch<ProviderAge>().age} kg",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          ),



          Consumer<ProviderAge>(
              builder: (BuildContext context, value, Widget? child) {
                return Slider(
                  label: "${context.watch<ProviderAge>().age}",
                  activeColor: Colors.green,
                  inactiveColor: Colors.green.shade100,

                  value: context.read<ProviderAge>().age.toDouble(),
                  min: min.toDouble(),
                  max: max.toDouble(),
                  divisions: 100,

                  onChanged: (newValue) => context.read<ProviderAge>().changeAge(newValue.toInt()),
                );
              }
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () => context.read<ProviderAge>().decrementAge(),
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: Icon(Icons.remove,color: iconText,)
              ),
              TextButton(
                onPressed: () => context.read<ProviderAge>().incrementAge(),
                style: TextButton.styleFrom( backgroundColor: Colors.white,),
                child: Icon(Icons.add,color: iconText,),)

            ],
          ),

        ],
      ),
    );
  }
}
