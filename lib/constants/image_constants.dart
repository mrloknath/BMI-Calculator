import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageConstants {
  static const imageBaseURL = "https://raw.githubusercontent.com/mrloknath/BMI-Calculator/refs/heads/main/";

  static const List<String> allImages = [
    // food main & options
    "assets/food/food.png",
    "assets/food/morning.png",
    "assets/food/lunch.png",
    "assets/food/snacks.png",
    "assets/food/dinner.png",

    // muscle strength main & options
    "assets/muscle_strength_exercise/muscle_strength_exercise.png",
    "assets/muscle_strength_exercise/barbel_row.gif",
    "assets/muscle_strength_exercise/bench_press.gif",
    "assets/muscle_strength_exercise/butterfly.gif",
    "assets/muscle_strength_exercise/plunk.gif",
    "assets/muscle_strength_exercise/pull_up.gif",
    "assets/muscle_strength_exercise/push_up.gif",
    "assets/muscle_strength_exercise/sit_up.gif",
    "assets/muscle_strength_exercise/squat.gif",

    // yoga main & options
    "assets/yoga/yoga.png",
    "assets/yoga/surya_namaskar.gif",
    "assets/yoga/bhujangasana.gif",
    "assets/yoga/chakrasana.gif",
    "assets/yoga/paschimottanasana.gif",
    "assets/yoga/sarvangasana.gif",
    "assets/yoga/vriksasana.gif",

    // result illustrations for man
    "assets/man/man_underweight.png",
    "assets/man/man_normal.png",
    "assets/man/man_overweight.png",
    "assets/man/man_obesity.png",

    // result illustrations for women
    "assets/women/women_underweight.png",
    "assets/women/women_normal.png",
    "assets/women/women_overweight.png",
    "assets/women/women_obesity.png",
  ];

  static void precacheAllImages(BuildContext context) {
    for (final path in allImages) {
      final url = "$imageBaseURL$path";
      precacheImage(CachedNetworkImageProvider(url), context).catchError((e) {
        debugPrint("Error pre-caching image $url: $e");
      });
    }
  }
}