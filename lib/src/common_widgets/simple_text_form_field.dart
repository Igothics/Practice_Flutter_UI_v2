import 'package:flutter/material.dart';
class SimpleTextFormField extends StatelessWidget {
  const SimpleTextFormField({super.key, this.label, this.value,});
  final String? label;
  final String? value;
  factory SimpleTextFormField.error(Object? error) => SimpleTextFormField(label: '$error'); // because of long error message
  factory SimpleTextFormField.loading(String? label) => SimpleTextFormField(label: label, value: 'loading...');

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    //TextFormField of the same context will share implicit TextEditingController through initialValue, so we can't only use ProfileTextFormField
    return TextFormField(
      initialValue: value,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        prefixText: label,
        contentPadding: EdgeInsets.zero,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline,),
        ),
      ),
    );
  }
}