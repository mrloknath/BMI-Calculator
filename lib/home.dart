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


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});


  @override
  State<StatefulWidget> createState() => _HomeScreen();

}
class _HomeScreen extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
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




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                    onPressed: (){

                    },
                    icon: const Icon(Icons.male),
                    label: const Text("MALE")),
                ElevatedButton.icon(
                    onPressed: (){

                    },
                    icon: const Icon(Icons.female),
                    label: const Text("FEMALE"))
              ],
            ),




            SizedBox(
              width: double.infinity,
              height: 450,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Height(height: 150, min: 0, max: 300),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AgeWeight(string: "WEIGHT (KG) ", amount: 100, min: 0,max: 200,),
                      AgeWeight(string: "AGE (Year)", amount: 50,min: 0,max: 100,)
                    ],
                  )
                ],
              ),
            ),




            ElevatedButton.icon(
                onPressed: <Widget>(){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BMIResult(bmi: 20.1))
                  );
                },
                icon: const Icon(Icons.verified),
                label: const Text("Let's Check B.M.I.")),
          ],
        ),
      ),




      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        tooltip: 'Reset',
        mini: true,
        child: const Icon(Icons.refresh),
      ),
    );
  }

}




class Height extends StatefulWidget{
  Height({super.key,required this.height,required this.min,required this.max});
  int height ,min,max;

  @override
  State<StatefulWidget> createState() => _Height();

}

class _Height  extends State<Height>{

  void increment(){ setState(() {widget.height=(widget.height>=widget.max)?widget.max:widget.height+1;});}
  void decrement(){setState(() {widget.height=(widget.height<=widget.min)?widget.min:widget.height-1;});}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: 150,
      //color: Colors.orangeAccent,
      decoration:  BoxDecoration( borderRadius: BorderRadius.circular(20), color: Colors.orangeAccent,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("HEIGHT (CM)"),
          Text("${widget.height}"),

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
                      widget.height=newValue.toInt();});
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: (){ decrement();},
                  style: TextButton.styleFrom( backgroundColor: Colors.green.shade100,),
                  child: const Icon(Icons.remove,color: Colors.green,)
              ),
              TextButton(
                onPressed: (){ increment();},
                style: TextButton.styleFrom( backgroundColor: Colors.green.shade100,),
                child: const Icon(Icons.add,color: Colors.green,),)],),
        ],
      ),
    );
  }
}




/*---------------------Custom widget for Age & Weight----------------------*/
class AgeWeight extends StatefulWidget{
  AgeWeight({super.key, required this.string, required this.amount, required this.min,required this.max});
  String string;
  int amount,min,max;

  @override
  State<StatefulWidget> createState() => _AgeWeight();
}

class _AgeWeight  extends State<AgeWeight>{

  void increment(){ setState(() {widget.amount=(widget.amount>=widget.max)?widget.max:widget.amount+1;});}
  void decrement(){setState(() { widget.amount=(widget.amount<=widget.min)?widget.min:widget.amount-1;});}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      //color: Colors.orangeAccent,
      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orangeAccent,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(widget.string),
          Text("${widget.amount}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: (){ decrement();},
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: const Icon(Icons.remove)
              ),
              TextButton(
                  onPressed: (){ increment();},
                  style: TextButton.styleFrom( backgroundColor: Colors.white,),
                  child: const Icon(Icons.add),)],),
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
                });
              })
        ],
      ),
    );
  }
}

