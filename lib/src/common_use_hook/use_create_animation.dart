import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AnimationController useCreateAnimation<T>({
  required T listenedValue,
  Duration? duration = const Duration(milliseconds: 300),
  Duration? reverseDuration = const Duration(milliseconds: 300),
}){
  final controller = useAnimationController(
    duration: duration,
    reverseDuration: reverseDuration,
  );
  useAnimation(controller);
  useValueChanged(listenedValue, (_, __) {
    controller.reset();
    return controller.forward();
  },);
  return controller;
}