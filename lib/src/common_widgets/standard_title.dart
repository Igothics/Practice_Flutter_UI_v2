import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StandardTitle<T> extends StatelessWidget {
  const StandardTitle(this.text, {super.key, this.padding, this.prefix = '', this.suffix = ''});
  final String text;
  final String? prefix;
  final String? suffix;
  final EdgeInsets? padding;

  factory StandardTitle.asyncValue({
    required AsyncValue<T> asyncValue,
    required String Function(T data) extractor,
    String? prefix,
    String? suffix,
    EdgeInsets? padding,
  }) {
    return StandardTitle(
      asyncValue.when<String>(
        data: extractor,
        error: (error,_) => 'Error: $error',
        loading: () => 'loading...'),
      prefix: prefix,
      suffix: suffix,
      padding: padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 16.0,),
      child: Text('$prefix$text$suffix', style: textTheme.titleLarge,),
    );
  }
}
