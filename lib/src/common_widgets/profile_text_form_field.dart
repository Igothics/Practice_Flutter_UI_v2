import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTextFormField extends StatelessWidget {
  const ProfileTextFormField({
    super.key,
    this.textStyle,
    this.readOnly = false,
    this.withUnderline = true,
    this.suffix,
    this.prefixText,
    this.initialValue = ' ',// space to show prefix && suffix
    this.suffixText,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
  });
  final TextStyle? textStyle;
  final bool readOnly;
  final bool withUnderline;
  final Widget? suffix;
  final String? prefixText;
  final String? initialValue;
  final String? suffixText;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      initialValue: initialValue,
      enableInteractiveSelection: !readOnly,
      readOnly: readOnly,
      textAlign: TextAlign.end,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: textStyle,
      decoration: InputDecoration(
        suffix: suffix,
        prefixText: prefixText,
        suffixText: suffixText,
        suffixStyle: textTheme.bodyLarge,
        contentPadding: EdgeInsets.zero,
        border: withUnderline ? null : InputBorder.none,
        focusedBorder: !withUnderline ? null : UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline,),
        ),
      ),
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
class MaxRangeLimit extends TextInputFormatter {
  MaxRangeLimit(this.limit);
  final int limit;
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.characters.length > limit && newValue.text.characters.length > oldValue.text.characters.length){
      return oldValue;
    }
    return newValue;
  }
}
