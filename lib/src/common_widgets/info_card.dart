import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    this.margin = EdgeInsets.zero,
    this.infoPadding = const EdgeInsets.all(16.0),
    this.children = const <Widget>[],
  });

  final EdgeInsets? margin;
  final EdgeInsets? infoPadding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: margin,
      child: Padding(
        padding: infoPadding ?? EdgeInsets.zero,
        child: DefaultTextStyle(
          style: textTheme.bodyMedium!,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
