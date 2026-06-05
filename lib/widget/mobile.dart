import 'package:flutter/material.dart';

class Mobile extends StatelessWidget {
  final Widget child;
  const Mobile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Only constrain width and height on desktop/web/tablet where the screen is wider than 500.
        // On standard mobile screens, let the app take the full width and height.
        if (constraints.maxWidth > 500) {
          return Center(
            child: SizedBox(
              width: 500,
              height: constraints.maxHeight > 900 ? 900 : constraints.maxHeight,
              child: child,
            ),
          );
        }
        return child;
      },
    );
  }
}