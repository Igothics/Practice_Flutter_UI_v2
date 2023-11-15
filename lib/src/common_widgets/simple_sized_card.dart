import 'package:flutter/material.dart';

class SimpleSizedCard extends StatelessWidget {
  const SimpleSizedCard({
    super.key,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.contentPadding,
    this.child,
  });

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final Widget? child;

  factory SimpleSizedCard.loading({
    double? width,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? contentPadding,
  }) {
    return SimpleSizedCard(
      width: width,
      height: height,
      margin: margin,
      contentPadding: contentPadding,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  factory SimpleSizedCard.error({
    double? width,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? contentPadding,
    required String errorMessage,
  }) {
    return SimpleSizedCard(
      width: width,
      height: height,
      margin: margin,
      contentPadding: contentPadding,
      child: Column(
        children: [
          const Text('Error:',),
          Text(errorMessage,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        margin: margin,
        child: Padding(
          padding: contentPadding ?? const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
