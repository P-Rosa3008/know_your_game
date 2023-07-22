import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KygPageTransition {
  const KygPageTransition({
    Key? key,
  }) : super();

  CustomTransitionPage build(Widget _page) {
    return CustomTransitionPage(
      child: _page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: animation.drive(
          Tween(begin: Offset(0.0, 1.0), end: Offset.zero).chain(
            CurveTween(
              curve: Curves.ease,
            ),
          ),
        ),
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 250),
    );
  }
}
