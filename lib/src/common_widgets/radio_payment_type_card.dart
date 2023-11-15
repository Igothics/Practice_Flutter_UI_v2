import 'package:flutter/material.dart';
class RadioPaymentTypeCard<T> extends StatelessWidget {
  const RadioPaymentTypeCard({
    super.key,
    required this.value,
    this.groupValue,
    required this.onChanged,
    this.titles,
    this.margin,
    this.contentPadding,
  });
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final List<Widget>? titles;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: groupValue == value ? 5.0 : 1.0,
      clipBehavior: Clip.antiAlias,
      margin: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () => onChanged(value),
        child: Padding(
          padding: contentPadding ?? EdgeInsets.zero,
          child: Row(
            children: [
              Radio(
                visualDensity: VisualDensity.compact,
                value: value,
                groupValue: groupValue,
                onChanged: (_){},
              ),
              ...?titles,
              const SizedBox(width: 16.0,),
            ],
          ),
        ),
      ),
    );
  }
}
