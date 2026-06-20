import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/image_constants.dart';
import 'package:zen_health/constants/color_constants.dart';

class MenuContainerScreen extends StatelessWidget {
  final String path;
  final String data;
  final String title;
  const MenuContainerScreen({super.key,required this.title,required this.path,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Goes back to the previous screen
          },
        ),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Hero(tag: title, child: ClipRRect(borderRadius:BorderRadius.circular(20),child: CachedNetworkImage(
                imageUrl: "${ImageConstants.imageBaseURL}$path",
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.lightGreen,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_outlined,
                  size: 40,
                ),
              ))),
              const Center(child: CircleAvatar(radius: 20,backgroundColor: AppColors.lightGreen,)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(left: 25,top: 0,right: 25,bottom: 0),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.bgLightGreen, AppColors.bgGreenAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.lightGreen.withOpacity(0.3), width: 1),
                ),
                child: Text(data, style: const TextStyle(color: AppColors.textDarkGreen,fontSize: 15,fontWeight: FontWeight.bold),),)
            ],
          ),
        ),
      ),
    );
  }
}
