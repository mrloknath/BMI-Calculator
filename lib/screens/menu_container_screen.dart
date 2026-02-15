import 'package:flutter/material.dart';

import '../constants/image_constants.dart';

class MenuContainerScreen extends StatelessWidget {
  final String path;
  final String data;
  final String title;
  const MenuContainerScreen({super.key,required this.title,required this.path,required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Hero(tag: title, child: ClipRRect(borderRadius:BorderRadius.circular(20),child: Image.network(
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
            "${ImageConstants.imageBaseURL}$path"))),
              const Center(child: CircleAvatar(radius: 20,backgroundColor: Colors.green,)),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(left: 25,top: 0,right: 25,bottom: 0),
                decoration: BoxDecoration(//color: Colors.transparent.withAlpha(20),
                    gradient: const LinearGradient(
                      colors: [Colors.yellowAccent,Colors.lightGreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(data, style: const TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),),)
            ],
          ),
        ),
      ),
    );
  }
}
