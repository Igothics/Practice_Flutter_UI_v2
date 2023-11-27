import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

class CountUp extends StatelessWidget {
  const CountUp(this.number, {
    super.key,
    this.padding,
    this.prefix,
    this.suffix,
    this.style,
  });

  final int number;
  final String? prefix;
  final String? suffix;
  final EdgeInsets? padding;
  final TextStyle? style;

  factory CountUp.text(int number) => CountUp(number,);

  factory CountUp.title(
    BuildContext context,
    int number, {
    String? prefix,
    String? suffix,
  }) => CountUp(
    number,
    padding: const EdgeInsets.only(top: 16.0,),
    style: Theme.of(context).textTheme.titleLarge,
    prefix: prefix,
    suffix: suffix,
  );

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Countup(
        begin: 0.0,
        end: number * 1.0,
        duration: Duration(milliseconds: 100 * number),
        style: style ?? const TextStyle(),
        prefix: prefix ?? '',
        suffix: suffix ?? '',
      ),
    );
  }
}
