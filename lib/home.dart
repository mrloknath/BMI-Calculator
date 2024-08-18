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
    return Column(
      children: <Widget>[
        const Text("Welcome"),
        const Text("BMI Calculator"),
        Row(
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
        const Row(
          children: <Widget>[
            
          ],
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
    );
  }

}