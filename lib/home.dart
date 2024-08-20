import 'package:bmi_calculte/result.dart';
import 'package:flutter/material.dart';

/*-----------------------Default Code---------------------*/
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter=_counter + 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:',),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}






/*------------------------New Home Screen-------------------*/
int h=0; //h=height
int w=0; //w=weight
int a=0; // a=age

double bmiCalculate(int height,int weight){
  double hM=height.toDouble()/100; // height in meter
  return weight.toDouble()/(hM*hM);
}

String getBMICategory(double bmi, String gender) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi < 24.9) {
    return 'Normal weight';
  } else if (bmi < 29.9) {
    return 'Overweight';
  } else {
    return 'Obesity';
  }
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Welcome"),
                Text("BMI Calculator"),
              ],
            ),


            MaleFemale(iconText: Colors.green,buttonBackColor: Colors.lightGreen,),


            SizedBox(
              //padding: EdgeInsets.all(10),
              //decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.2),borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              height: 450,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Height(height: 150, min: 0, max: 300),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Weight(string: "WEIGHT", amount: 100, min: 0,max: 200,),
                      Age(string: "AGE", amount: 50,min: 0,max: 100,)
                    ],
                  )
                ],
              ),
            ),




            Container(
              width: double.infinity,

              margin: const EdgeInsets.only(left:10 ,right: 60),
             // decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.2),borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton.icon(
                  onPressed: <Widget>(){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BMIResult(bmi: bmiCalculate(h,w)))
                    );
                  },

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.lightGreen,
                      elevation: 20,

                  ),
                  icon: Icon(Icons.verified,color: iconText,),
                  label: Text("Let's Check B.M.I.",style: TextStyle(color: iconText))),
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


/*--------------------------------Male Female------------------*/
class MaleFemale extends StatefulWidget{
  MaleFemale({super.key,required this.iconText,required this.buttonBackColor});
  Color iconText;
  Color buttonBackColor;
  @override
  State<StatefulWidget> createState() => _MaleFemale();

}

class _MaleFemale  extends State<MaleFemale>{
  Color maleButtonBackground=Colors.white,femaleButtonBackground=Colors.white;
  Color maleIconText=Colors.green,femaleIconText=Colors.green;

  @override
  Widget build(BuildContext context) {
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: <Widget>[
       ElevatedButton.icon(
           onPressed: (){
             setState(() {
               maleIconText=Colors.white;
               femaleIconText=widget.buttonBackColor;
               maleButtonBackground=widget.buttonBackColor;
               femaleButtonBackground=Colors.white;
             });
           },

           style: ElevatedButton.styleFrom(backgroundColor: maleButtonBackground, ),
           icon: Icon(Icons.male,color: maleIconText,),
           label: Text("MALE",style: TextStyle(color: maleIconText))),
       ElevatedButton.icon(
           onPressed: (){
             setState(() {
               femaleIconText=Colors.white;
               maleIconText=widget.buttonBackColor;
               femaleButtonBackground=widget.buttonBackColor;
               maleButtonBackground=Colors.white;
             });
           },
           style: ElevatedButton.styleFrom(backgroundColor:femaleButtonBackground, ),
           icon: Icon(Icons.female,color: femaleIconText,),
           label: Text("FEMALE",style: TextStyle(color: femaleIconText),))
     ],
   );
  }
}





/*------------------------------------Height----------------------------------*/
class Height extends StatefulWidget{
  Height({super.key,required this.height,required this.min,required this.max});
  int height ,min,max;

  @override
  State<StatefulWidget> createState() => _Height();

}

class _Height  extends State<Height>{
  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;
  void increment(){
    setState(() {
      widget.height=(widget.height>=widget.max)?widget.max:widget.height+1;
      h=widget.height;
  });}
  void decrement(){
    setState(() {
      widget.height=(widget.height<=widget.min)?widget.min:widget.height-1;
      h=widget.height;
  });}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: 150,
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
          Text("${widget.height} cm",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          ),

          SizedBox(
            height: 300,
            child: RotatedBox(
              quarterTurns: 3,
              child: Slider(

                  activeColor: Colors.green,
                  inactiveColor: Colors.green.shade100,

                  value:widget.height as double,
                  min: widget.min as double,
                  max:widget.max as double,
                  divisions: 300,

                  onChanged: (newValue){
                    setState(() {
                      widget.height=newValue.toInt();
                      h=widget.height;
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
  Weight({super.key, required this.string, required this.amount, required this.min,required this.max});
  String string;
  int amount,min,max;

  @override
  State<StatefulWidget> createState() => _Weight();
}

class _Weight  extends State<Weight>{
  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;
  void increment(){
    setState(() {
      widget.amount=(widget.amount>=widget.max)?widget.max:widget.amount+1;
      w=widget.amount;
    });}
  void decrement(){
    setState(() {
      widget.amount=(widget.amount<=widget.min)?widget.min:widget.amount-1;
      w=widget.amount;
    });}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
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
          Text("${widget.amount} kg",
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
              label: "${widget.amount}",
              activeColor: Colors.green,
              inactiveColor: Colors.green.shade100,

              value: widget.amount as double,
              min: widget.min as double ,
              max: widget.max as double,
              divisions: 100,

              onChanged: (newValue ){
                setState(() {
                  widget.amount= newValue.toInt();
                  w=widget.amount;
                });
              })
        ],
      ),
    );
  }
}






/*------------------------------------Age----------------------------------*/
class Age extends StatefulWidget{
  Age({super.key, required this.string, required this.amount, required this.min,required this.max});
  String string;
  int amount,min,max;

  @override
  State<StatefulWidget> createState() => _Age();
}

class _Age  extends State<Age>{

  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;

  void increment(){
    setState(() {
      widget.amount=(widget.amount>=widget.max)?widget.max:widget.amount+1;
      a=widget.amount;
    });}
  void decrement(){
    setState(() {
      widget.amount=(widget.amount<=widget.min)?widget.min:widget.amount-1;
      a=widget.amount;
    });}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
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
          Text("${widget.amount} Year",
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
              label: "${widget.amount}",
              activeColor: Colors.green,
              inactiveColor: Colors.green.shade100,

              value: widget.amount as double,
              min: widget.min as double ,
              max: widget.max as double,
              divisions: 100,

              onChanged: (newValue ){
                setState(() {
                  widget.amount= newValue.toInt();
                  a=widget.amount;
                });
              })
        ],
      ),
    );
  }
}

