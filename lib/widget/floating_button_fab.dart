import 'package:animated_expandable_fab/animated_expandable_fab.dart';
import 'package:bmi_calculte/health_tips/muscle_strength_exercise.dart';
import 'package:bmi_calculte/health_tips/yoga.dart';
import 'package:flutter/material.dart';
import '../health_tips/food.dart';


class FloatingButtonFab extends StatefulWidget {
  const FloatingButtonFab({super.key,required this.color,required this.bmi});
  final Color color;
  final double bmi;


  @override
  State<FloatingButtonFab> createState() => _FloatingButtonFabState();
}

class _FloatingButtonFabState extends State<FloatingButtonFab> {


  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      closeBackgroundColor: widget.color,
      closeElevation: 10,
      closeShadowColor: Colors.green,
      distance: 75.0,
      openIcon: Icon(Icons.accessibility,color:widget.color),
      closeIcon: const Icon(Icons.close,color:Colors.white),
      children: [
        /*----------------Food--------------*/
        ActionButton(
          color: Colors.white,
          icon:  Center(
            child: GestureDetector(
              onTap: () {Navigator.push(
                context, PageRouteBuilder(transitionDuration: const Duration(seconds: 1),pageBuilder: (context, animation, secondaryAnimation)
              => Food(bmi: widget.bmi,heroTag: "food",),
                  ),
                );
              },
            child: Hero(tag: "food",
            child: Image.asset("assets/food/food.png", width: 30,height:30)),
          ),),
         // text: Text("Food"),
          onPressed: (){},
        ),
        
        
        /*----------------Muscle Exercise--------------*/
        ActionButton(
          color: Colors.white,
          icon:   Center(
            child: GestureDetector(
              onTap: () {Navigator.push(
                    context, PageRouteBuilder(transitionDuration: const Duration(seconds: 1),pageBuilder: (context, animation, secondaryAnimation)
                      => MuscleStrengthExercise(bmi: widget.bmi,heroTag: "mse"),
          ),
          );
          },
          child: Hero(tag: "mse",
          child:Image.asset("assets/muscle_strength_exercise/muscle_strength_exercise.png", width: 30,height:30)))),
         // text: Text("Food"),
          onPressed: (){
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => MuscleStrengthExercise(bmi: widget.bmi,))
            // );
          },
        ),


        /*--------------------------Yoga--------------*/
        ActionButton(
          color: Colors.white,
          icon:  Center(
            child: GestureDetector(
              onTap: () {Navigator.push(
                context, PageRouteBuilder(transitionDuration: const Duration(seconds: 1),pageBuilder: (context, animation, secondaryAnimation)
                  => Yoga(bmi: widget.bmi,heroTag: "yoga"),
            ),
            );
            },
            child: Hero(tag: "yoga",
            child: Image.asset("assets/yoga/yoga.png", width: 30,height:30),))),
         // text: Text("Food"),
          onPressed: (){
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Yoga(bmi: widget.bmi,))
            // );
          },
        ),

      ],
    );
  }
}
