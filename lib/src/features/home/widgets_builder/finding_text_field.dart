import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FindingTextFieldBuilder extends HookConsumerWidget {
  const FindingTextFieldBuilder({super.key, this.padding,});
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon:
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          labelText: 'Find Restaurants',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
