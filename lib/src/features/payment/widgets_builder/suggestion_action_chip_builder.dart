import 'package:flutter/material.dart';

class SuggestionActionChipBuilder extends StatelessWidget {
  const SuggestionActionChipBuilder(
    this.textController, {
    super.key,
    this.padding,
  });
  final TextEditingController textController;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: List.generate(
          15,
          (index) {
            const initial = 50.0;
            final number = initial * index + initial;
            return ActionChip(
              label: Text('$number'),
              onPressed: () => textController.text = number.toString(),
            );
          },
        ),
      ),
    );
  }
}
