import 'package:bmi_calculte/screens/result.dart';
import 'package:flutter/material.dart';




int h=180; //h=height
int w=65; //w=weight
int a=50; // a=age
String maleFemale="man";

double bmiCalculate(int height,int weight){
  double hM=height.toDouble()/100; // height in meter
  return weight.toDouble()/(hM*hM);
}






class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{
  int height=0,weight=0,age=0;
  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Height(height: h, min: 0, max: 300),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Weight(string: "WEIGHT", amount: w, min: 0,max: 200,),
                      Age(string: "AGE", amount: a,min: 0,max: 100,)
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
                      MaterialPageRoute(builder: (context) => BMIResult(bmi: bmiCalculate(h,w), maleFemale: maleFemale,age: a,height: h,weight: w))
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
    );
  }

}




/*---------------------------------------------male female----------------------------------------*/


class MaleFemale extends StatefulWidget{
  const MaleFemale({super.key,required this.iconText,required this.buttonBackColor});
  final Color iconText;
  final Color buttonBackColor;
  @override
  State<StatefulWidget> createState() => _MaleFemale();

}

class _MaleFemale  extends State<MaleFemale>{
  Color maleButtonBackground=Colors.white,femaleButtonBackground=Colors.white;
  Color maleIconText=Colors.green,femaleIconText=Colors.green;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.transparent.withAlpha(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: (){
                setState(() {
                  maleFemale="man";
                  maleIconText=Colors.white;
                  femaleIconText=widget.buttonBackColor;
                  maleButtonBackground=widget.buttonBackColor;
                  femaleButtonBackground=Colors.white;
                });
              },

              style: ElevatedButton.styleFrom(backgroundColor: maleButtonBackground, ),
              icon: Icon(Icons.man,color: maleIconText,size: 30,),
              label: Text("MALE",style: TextStyle(color: maleIconText))),
          ElevatedButton.icon(
              onPressed: (){
                setState(() {
                  maleFemale="women";
                  femaleIconText=Colors.white;
                  maleIconText=widget.buttonBackColor;
                  femaleButtonBackground=widget.buttonBackColor;
                  maleButtonBackground=Colors.white;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor:femaleButtonBackground, ),
              icon: Icon(Icons.woman,color: femaleIconText,size: 30,),
              label: Text("FEMALE",style: TextStyle(color: femaleIconText),))
        ],
      ),
    );
  }
}






















/*------------------------------------Height----------------------------------*/
class Height extends StatefulWidget{
  const Height({super.key,required this.height,required this.min,required this.max});
  final int  min,max;
  final int height;

  @override
  State<StatefulWidget> createState() => _Height();

}

class _Height  extends State<Height>{
  late int height;
  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;
  void increment(){
    setState(() {
      height=(height>=widget.max)?widget.max:height+1;
      h=height;
  });}
  void decrement(){
    setState(() {
      height=(height<=widget.min)?widget.min:height-1;
      h=height;
  });}

  @override
  void initState() {
    super.initState();
    height=widget.height;
  }

  @override
  Widget build(BuildContext context) {

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
          Text("$height cm",
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
              child: Slider(
                  label: "$height",
                  activeColor: Colors.green,
                  inactiveColor: Colors.green.shade100,

                  value:height as double,
                  min: widget.min as double,
                  max:widget.max as double,
                  divisions: 300,

                  onChanged: (newValue){
                    setState(() {
                      height=newValue.toInt();
                      h=height;
                    });
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: (){ decrement();},
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: Icon(Icons.remove,color: iconText,)
              ),
              TextButton(
                onPressed: (){ increment();},
                style: TextButton.styleFrom( backgroundColor: Colors.white,),
                child: Icon(Icons.add,color: iconText,),)],),
        ],
      ),
    );
  }
}




/*------------------------------------Weight----------------------------------*/
class Weight extends StatefulWidget{
  const Weight({super.key, required this.string, required this.amount, required this.min,required this.max});
  final String string;
  final int min,max;
  final int amount;

  @override
  State<StatefulWidget> createState() => _Weight();
}

class _Weight  extends State<Weight>{
  late int amount;
  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;
  void increment(){
    setState(() {
      amount=(amount>=widget.max)?widget.max:amount+1;
      w=amount;
    });}
  void decrement(){
    setState(() {
      amount=(amount<=widget.min)?widget.min:amount-1;
      w=amount;
    });}
  @override
  void initState() {
    super.initState();
    amount=widget.amount;
  }

  @override
  Widget build(BuildContext context) {
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
          Text("$amount kg",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: (){ decrement();},
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: Icon(Icons.remove,color: iconText,)
              ),
              TextButton(
                  onPressed: (){ increment();},
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: Icon(Icons.add,color: iconText,),)],),
          Slider(
              label: "$amount",
              activeColor: Colors.green,
              inactiveColor: Colors.green.shade100,

              value: amount as double,
              min: widget.min as double ,
              max: widget.max as double,
              divisions: 100,

              onChanged: (newValue ){
                setState(() {
                  amount= newValue.toInt();
                  w=amount;
                });
              })
        ],
      ),
    );
  }
}






/*------------------------------------Age----------------------------------*/
class Age extends StatefulWidget{
  const Age({super.key, required this.string, required this.amount, required this.min,required this.max});
  final String string;
  final int min,max;
  final int amount;

  @override
  State<StatefulWidget> createState() => _Age();
}

class _Age  extends State<Age>{
  late int amount;
  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;

  void increment(){
    setState(() {
      amount=(amount>=widget.max)?widget.max:amount+1;
      a=amount;
    });}
  void decrement(){
    setState(() {
      amount=(amount<=widget.min)?widget.min:amount-1;
      a=amount;
    });}
  @override
  void initState() {
    super.initState();
    amount=widget.amount;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 125,
      //color: Colors.orangeAccent,
      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20), color: buttonBackColor,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("AGE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text("$amount Year",
            style: const TextStyle(
              fontSize: 25,
            fontWeight: FontWeight.bold,
            color:Colors.white,
          ),
    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: (){ decrement();},
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: Icon(Icons.remove,color: iconText,)
              ),
              TextButton(
                onPressed: (){ increment();},
                style: TextButton.styleFrom( backgroundColor: Colors.white,),
                child: Icon(Icons.add,color: iconText,),)],),
          Slider(
              label: "$amount",
              activeColor: Colors.green,
              inactiveColor: Colors.green.shade100,

              value: amount as double,
              min: widget.min as double ,
              max: widget.max as double,
              divisions: 100,

              onChanged: (newValue ){
                setState(() {
                  amount= newValue.toInt();
                  a=amount;
                });
              })
        ],
      ),
    );
  }
}

