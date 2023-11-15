import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideTransitionPage extends CustomTransitionPage<void> {
  SlideTransitionPage({
    required LocalKey super.key,
    required super.child,
    this.offset = const Offset(1.0, 0.0),
    super.transitionDuration,
    super.reverseTransitionDuration,
  }): super(
    transitionsBuilder: (_, animation,__,child) {
      return SlideTransition(
        position: animation.drive(_getTween(offset)),
        child: child,
      );
    },
  );
  final Offset offset;
  static Animatable<Offset> _getTween(Offset offset) => Tween<Offset>(
    begin: offset,
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.linear,),);
}
