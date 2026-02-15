import 'dart:async';

import 'package:animated_expandable_fab/animated_expandable_fab.dart';
import 'package:zen_health/health_tips/muscle_strength_exercise.dart';
import 'package:zen_health/health_tips/yoga.dart';
import 'package:flutter/material.dart';
import '../constants/image_constants.dart';
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
      // openIcon: Icon(Icons.accessibility,color:widget.color),
      openIcon: changingIcon(
        icons: [Icons.self_improvement, Icons.sports_gymnastics, Icons.restaurant],
        color: widget.color,
        size: 32,
      ),
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
            // child: Image.asset("assets/food/food.png", width: 30,height:30)),
            child: Image.network("${ImageConstants.imageBaseURL}assets/food/food.png",
                width: 30,
                height:30,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child; // image loaded
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_outlined,
                  size: 40,
                );
              },
            )),
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
          child:Image.network(
              loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child; // image loaded
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  size: 40,
                );
              },
              "${ImageConstants.imageBaseURL}assets/muscle_strength_exercise/muscle_strength_exercise.png", width: 30,height:30)))),
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
            // child: Image.asset("assets/yoga/yoga.png", width: 30,height:30),))),
            child: Image.network(
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // image loaded
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_outlined,
                    size: 40,
                  );
                },
                "${ImageConstants.imageBaseURL}assets/yoga/yoga.png", width: 30,height:30),))),
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




  Widget changingIcon({
    required List<IconData> icons,
    required Color color,
    Duration duration = const Duration(seconds: 1),
    double size = 24,
  }) {
    final index = ValueNotifier(0);

    Timer.periodic(duration, (t) {
      if (!index.hasListeners) {
        t.cancel(); // ✅ stop when widget is gone
        return;
      }
      index.value = (index.value + 1) % icons.length;
    });

    return ValueListenableBuilder<int>(
      valueListenable: index,
      builder: (_, i, __) => Icon(
        icons[i],
        color: color,
        size: size,
      ),
    );
  }


}
