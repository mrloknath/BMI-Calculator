import 'dart:async';

import 'package:animated_expandable_fab/animated_expandable_fab.dart';
import 'package:zen_health/health_tips/muscle_strength_exercise.dart';
import 'package:zen_health/constants/color_constants.dart';
import 'package:zen_health/health_tips/yoga.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      closeShadowColor: AppColors.lightGreen,
      distance: 75.0,
      // openIcon: Icon(Icons.accessibility,color:widget.color),
      openIcon: ChangingIcon(
        icons: const [Icons.self_improvement, Icons.sports_gymnastics, Icons.restaurant],
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
            child: CachedNetworkImage(
              imageUrl: "${ImageConstants.imageBaseURL}assets/food/food.png",
              width: 30,
              height: 30,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.lightGreen,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.image_outlined,
                size: 40,
              ),
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
          child: CachedNetworkImage(
            imageUrl: "${ImageConstants.imageBaseURL}assets/muscle_strength_exercise/muscle_strength_exercise.png",
            width: 30,
            height: 30,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.lightGreen,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 40,
            ),
          )))),
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
            child: CachedNetworkImage(
              imageUrl: "${ImageConstants.imageBaseURL}assets/yoga/yoga.png",
              width: 30,
              height: 30,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.lightGreen,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.image_outlined,
                size: 40,
              ),
            ),))),
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

class ChangingIcon extends StatefulWidget {
  final List<IconData> icons;
  final Color color;
  final Duration duration;
  final double size;

  const ChangingIcon({
    super.key,
    required this.icons,
    required this.color,
    this.duration = const Duration(seconds: 1),
    this.size = 24,
  });

  @override
  State<ChangingIcon> createState() => _ChangingIconState();
}

class _ChangingIconState extends State<ChangingIcon> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.duration, (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.icons.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icons[_currentIndex],
      color: widget.color,
      size: widget.size,
    );
  }
}
