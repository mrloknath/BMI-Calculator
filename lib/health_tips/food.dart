import 'package:zen_health/widget/menu_container.dart';
import 'package:flutter/material.dart';

import '../constants/image_constants.dart';
import '../information/food_information.dart';




class Food extends StatelessWidget {
  const Food({super.key, required this.bmi,required this.heroTag,});
  final double bmi;
  final String heroTag;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightGreen.shade300,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Food Diet"),
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
                  "${ImageConstants.imageBaseURL}assets/food/food.png",width: 300,height: 300,)),
                const Wrap(
                  runSpacing: 20.0,
                  spacing: 30.0,
                  children: [
                    MenuContainer(title: "Breakfast", path: "assets/food/morning.png",data: breakfast,),
                    MenuContainer(title: "Lunch", path: "assets/food/lunch.png",data: lunch,),
                    MenuContainer(title: "Snacks", path: "assets/food/snacks.png",data: snacks,),
                    MenuContainer(title: "Dinner", path: "assets/food/dinner.png",data: dinner,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
