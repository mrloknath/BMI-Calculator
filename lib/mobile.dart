/*This example shows how to create a custom widget class that can take any widget as its child,
 giving you flexibility to build reusable components in your Flutter app.

 USE CASE     home: FixedSizeLayout (
                  child: widget,
            );
 */

import 'package:flutter/material.dart';

class Mobile extends StatelessWidget{
  final Widget child;
  const Mobile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    const double fixedWidth = 350;
    const double fixedHeight = 700;

    return LayoutBuilder(
      builder:(context, constraints) {

        return Center(
          child: SizedBox(
            width: fixedWidth,
            height: fixedHeight,
            child: child,
          ),
        );
      },);
  }

}