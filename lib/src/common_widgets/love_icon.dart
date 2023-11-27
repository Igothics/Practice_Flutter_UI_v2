import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoveIcon extends StatelessWidget {
  const LoveIcon({
    super.key,
    this.iconSize = 48,
    this.controller,
  });
  final double? iconSize;
  final Animation<double>? controller;
  @override
  Widget build(BuildContext context) {

    return FittedBox(
      child: Lottie.asset(
        'assets/jsons/favorite.json',
        controller: controller,
        width: iconSize,
        height: iconSize,
      ),
    );
  }
}
