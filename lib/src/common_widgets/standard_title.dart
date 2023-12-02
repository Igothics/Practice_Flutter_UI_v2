import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StandardTitle<T> extends StatelessWidget {
  const StandardTitle(this.text, {super.key, this.padding, this.prefix = '', this.suffix = ''});
  final String text;
  final String? prefix;
  final String? suffix;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 16.0,),
      child: Text('$prefix$text$suffix', style: textTheme.titleLarge,),
    );
  }
}
