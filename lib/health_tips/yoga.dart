import 'package:zen_health/widget/menu_container.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/image_constants.dart';
import '../information/yoga_information.dart';
import 'package:zen_health/constants/color_constants.dart';

class Yoga extends StatelessWidget {
  const Yoga({super.key,required this.bmi,required this.heroTag,});
  final double bmi;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text("Yoga Asana"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Goes back to the previous screen
            },
          ),
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgLightGreen, AppColors.bgGreenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(tag: heroTag,
                    child: CachedNetworkImage(
                      imageUrl: "${ImageConstants.imageBaseURL}assets/yoga/yoga.png",
                      width: 300,
                      height: 300,
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
                    const Wrap(
                      runSpacing: 20.0,
                      spacing: 30.0,
                      children: [
                        MenuContainer(title: "Surya Namaskar", path: "assets/yoga/surya_namaskar.gif",data: suryaNamaskarInstruction,),
                        MenuContainer(title: "Bhujangasana", path: "assets/yoga/bhujangasana.gif",data: bhujangasanaInstruction,),
                        MenuContainer(title: "Chakrasana", path: "assets/yoga/chakrasana.gif",data: chakrasanaInstruction,),
                        MenuContainer(title: "Paschimottanasana", path: "assets/yoga/paschimottanasana.gif",data: paschimottanasanaInstruction,),
                        MenuContainer(title: "Sarvangasana", path: "assets/yoga/sarvangasana.gif",data: sarvangasanaInstruction,),
                        MenuContainer(title: "Vriksasana", path: "assets/yoga/vriksasana.gif",data: vrikshasanaInstruction,),
                      ],
                    )
                  ],
                ),
            ),
          ),
        ),
      )
    );
  }
}
