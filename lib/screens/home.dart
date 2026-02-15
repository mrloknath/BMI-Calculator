import 'package:zen_health/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_height.dart';
import '../provider/provider_weight.dart';
import '../widget/age.dart';
import '../widget/height.dart';
import '../widget/male_female.dart';
import '../widget/weight.dart';



class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{
  int height=0,weight=0,age=0;
  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;

  double bmiCalculate(){

    int height=context.read<ProviderHeight>().height;
    int weight=context.read<ProviderWeight>().weight;

    double hM=height.toDouble()/100; // height in meter
    return weight.toDouble()/(hM*hM);
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            //color: Colors.green.shade100,
            gradient: LinearGradient(
                colors: [Colors.yellowAccent,Colors.lightGreenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.transparent.withAlpha(10)),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome to Healthy Tips",style: TextStyle(fontSize:15,color: iconText,)),
                    Text("First calculate your BMI",style: TextStyle(fontSize:20,color: iconText,)),
                  ],
                ),
              ),


              const MaleFemale(iconText: Colors.green,buttonBackColor: Colors.lightGreen,),


              Container(
                width: double.infinity,
                height: 450,
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.transparent.withAlpha(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Height(min: 0, max: 300),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Weight(min: 0,max: 200,),
                        Age(min: 0,max: 100,)
                      ],
                    )
                  ],
                ),
              ),




              Container(
                height: 50,
                margin: const EdgeInsets.only(left: 50,right: 50),
                child: ElevatedButton.icon(
                    onPressed: <Widget>(){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMIResult(bmi: bmiCalculate()))
                      );
                    },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.lightGreen,
                        elevation: 20,

                    ),
                    icon: Icon(Icons.verified,color: iconText,),
                    label: Text("Check B.M.I.",style: TextStyle(fontSize:25,color: iconText,))),
              ),
            ],
          ),
        ),




        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          backgroundColor: Colors.white,
          tooltip: 'Reset',
          mini: true,
          child: Icon(Icons.refresh,color: iconText,),
        ),
      ),
    );
  }

}


