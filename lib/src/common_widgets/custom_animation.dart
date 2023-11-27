import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';

class CustomAnimation extends StatelessWidget {
  const CustomAnimation({
    super.key,
    required this.child,
    this.delay,
    this.controller,
    this.effects,
  });
  final Widget child;
  final Duration? delay;
  final AnimationController? controller;
  final List<Effect<dynamic>>? effects;

  factory CustomAnimation.shake({
    AnimationController? controller,
    required Widget child,
  }) => CustomAnimation(
    controller: controller,
    effects: const [ShakeEffect(offset: Offset(0.5, 0.5), rotation: 0.3,),],
    child: child,
  );
  factory CustomAnimation.fadeSlide({
    Duration? delay = const Duration(milliseconds: 300),
    SlideAxis direction = SlideAxis.topToBottom,
    required Widget child,
  }) => CustomAnimation(
    delay: delay,
    effects: [
      const FadeEffect(),
      SlideEffect(
        begin: switch(direction){
          SlideAxis.topToBottom => const Offset(0.0, -0.5),
          SlideAxis.bottomToTop => const Offset(0.0, 0.5),
          SlideAxis.leftToRight => const Offset(-0.5, 0.0),
          SlideAxis.rightToLeft => const Offset(0.5, 0.0),
        },
      ),
    ],
    child: child,
  );
  @override
  Widget build(BuildContext context) {
    return Animate(
      delay: delay,
      controller: controller,
      effects: effects,
      child: child,
    );
  }
}
