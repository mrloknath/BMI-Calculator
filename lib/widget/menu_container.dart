import 'package:zen_health/screens/menu_container_screen.dart';
import 'package:flutter/material.dart';

import '../constants/image_constants.dart';

class MenuContainer extends StatelessWidget {
  final String title;
  final String data;
  final String path;

  const MenuContainer({super.key, required this.title,required this.path,required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(// Background color
        color: Colors.white,
        borderRadius: BorderRadius.circular(50), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
          onTap: () { Navigator.push(
            context, PageRouteBuilder(transitionDuration: const Duration(seconds: 1),pageBuilder: (context, animation, secondaryAnimation)
            => MenuContainerScreen(title: title, path: path, data: data)),);},
            child: Hero(tag: title,
              child: ClipRRect(borderRadius: BorderRadius.circular(50),
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
                      "${ImageConstants.imageBaseURL}$path",height:120, width:150,fit: BoxFit.cover,))),
          ),

          Center(
            child: Text(title,style:const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              //backgroundColor: Colors.grey.shade50,// Ensures text visibility
            ),
              textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
