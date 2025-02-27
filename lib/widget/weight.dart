import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_weight.dart';




class Weight extends StatelessWidget{
  const Weight({super.key, required this.min,required this.max});
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
          const Text("WEIGHT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text("${context.watch<ProviderWeight>().weight} kg",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          ),



          Consumer<ProviderWeight>(
            builder: (BuildContext context, value, Widget? child) {
              return Slider(
                label: "${context.watch<ProviderWeight>().weight}",
                activeColor: Colors.green,
                inactiveColor: Colors.green.shade100,

                value: context.read<ProviderWeight>().weight.toDouble(),
                min: min.toDouble(),
                max: max.toDouble(),
                divisions: 100,

                onChanged: (newValue) => context.read<ProviderWeight>().changeWeight(newValue.toInt()),
              );
            }
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () => context.read<ProviderWeight>().decrementWeight(),
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: Icon(Icons.remove,color: iconText,)
              ),
              TextButton(
                onPressed: () => context.read<ProviderWeight>().incrementWeight(),
                style: TextButton.styleFrom( backgroundColor: Colors.white,),
                child: Icon(Icons.add,color: iconText,),)

            ],
          ),

        ],
      ),
    );
  }
}
