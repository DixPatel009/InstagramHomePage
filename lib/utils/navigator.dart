import 'package:flutter/material.dart';

enum AnimationType {
  slide,
  fade,
}

class NavigatorUtils {
  //push and replace old screen
  static void pushReplace(
    BuildContext context,
    Widget widget, {
    AnimationType animationType = AnimationType.slide,
  }) {
    Navigator.pushReplacement(
      context,
      createRoute(
        widget,
        animationType,
      ),
    );
  }

  //create page route
  static PageRouteBuilder createRoute(
    Widget widget,
    AnimationType animationType,
  ) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //Handle all page transition
        switch (animationType) {
          case AnimationType.slide:
            return SlideTransition(
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).chain(CurveTween(curve: Curves.fastOutSlowIn)).animate(animation),
              child: child,
            );
          case AnimationType.fade:
            return FadeTransition(
              opacity: Tween(
                begin: 0.0,
                end: 1.0,
              ).chain(CurveTween(curve: Curves.fastOutSlowIn)).animate(animation),
              child: child,
            );
        }
      },
    );
  }
}
