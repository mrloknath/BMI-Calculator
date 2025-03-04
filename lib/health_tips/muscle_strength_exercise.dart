import 'package:zen_health/information/muscle_trength_exercise_information.dart';
import 'package:zen_health/widget/menu_container.dart';
import 'package:flutter/material.dart';

class MuscleStrengthExercise extends StatelessWidget {
  const MuscleStrengthExercise({super.key,required this.bmi,required this.heroTag});
  final double bmi;
  final String heroTag;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.lightGreen.shade300,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Muscle Exercise"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Goes back to the previous screen
            },
          ),
        ),

      body: Center(
        child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(tag: heroTag,
                child: Image.asset("assets/muscle_strength_exercise/muscle_strength_exercise.png",width: 300,height: 300,)),
                const Wrap(
                  runSpacing: 20.0,
                  spacing: 30.0,
                  children: [
                    MenuContainer(title: "Barbel Row", path: "assets/muscle_strength_exercise/barbel_row.gif",data: barbellRowInstruction,),
                    MenuContainer(title: "Bench Press", path: "assets/muscle_strength_exercise/bench_press.gif",data: benchPressInstruction,),
                    MenuContainer(title: "Butterfly", path: "assets/muscle_strength_exercise/butterfly.gif",data: legButterflyInstruction,),
                    MenuContainer(title: "Plunk", path: "assets/muscle_strength_exercise/plunk.gif",data: plankInstruction,),
                    MenuContainer(title: "Pull Up", path: "assets/muscle_strength_exercise/pull_up.gif",data: pullUpInstruction,),
                    MenuContainer(title: "Push Up", path: "assets/muscle_strength_exercise/push_up.gif",data: pushUpInstruction,),
                    MenuContainer(title: "Sit up", path: "assets/muscle_strength_exercise/sit_up.gif",data: sitUpInstruction,),
                    MenuContainer(title: "Squat", path: "assets/muscle_strength_exercise/squat.gif",data: squatInstruction,),
                  ],
                )
              ],
            ),
      ),
    ));
  }
}
