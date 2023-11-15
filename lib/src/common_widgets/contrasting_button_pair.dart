import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/common_widgets/customized_elevated_button.dart';
import 'package:practice_food_delivery/src/common_widgets/customized_outline_button.dart';

class ContrastingButtonPair extends StatelessWidget {
  const ContrastingButtonPair({
    super.key,
    this.padding,
    this.gap,
    required this.leftTitle,
    this.leftEnabled = true,
    required this.onLeftPressed,
    required this.rightTitle,
    this.rightEnabled = true,
    this.onRightPressed,
    this.seedColor,
  });
  final EdgeInsets? padding;
  final double? gap;
  final String leftTitle;
  final bool leftEnabled;
  final VoidCallback? onLeftPressed;
  final String rightTitle;
  final bool rightEnabled;
  final VoidCallback? onRightPressed;
  final Color? seedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: CustomOutlineButton(
                enable: leftEnabled,
                foregroundColor: seedColor,
                borderColor: seedColor,
                onPressed: onLeftPressed,
                child: Text(leftTitle,),),
          ),
          SizedBox(
            width: gap,
          ),
          Expanded(
            child: CustomElevatedButton(
              enable: rightEnabled,
              backgroundColor: seedColor,
              onPressed: onRightPressed,
              child: Text(rightTitle,),
            ),
          ),
        ],
      ),
    );
  }
}
