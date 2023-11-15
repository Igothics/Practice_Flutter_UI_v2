import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.size,
    this.alignment,
    this.color = Colors.orangeAccent,
  });
  final double rating;
  final double? size;
  final Color? color;
  final MainAxisAlignment? alignment;

  Icon get star => Icon(Icons.star_rounded, size: size, color: color,);
  Icon get starHalf => Icon(Icons.star_half_rounded, size: size, color: color,);
  Icon get starBorder => Icon(Icons.star_border_rounded, size: size, color: color,);

  @override
  Widget build(BuildContext context) {
    final starCount = rating.truncate();
    final starBorderCount = (5 - rating).truncate();
    final starHalfCount = 5 - starCount - starBorderCount;

    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      children: [
        ...List.generate(starCount, (_) => star,),
        ...List.generate(starHalfCount, (_) => starHalf,),
        ...List.generate(starBorderCount, (_) => starBorder,),
      ],
    );
  }
}
