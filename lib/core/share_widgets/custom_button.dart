import 'package:flutter/material.dart';
import '../theming/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.textColor,
    required this.backGroundColor,
    this.borderRadius,
    this.onPressed,
    required this.text,
    this.fontSize,
  });
  final Color textColor;
  final Color backGroundColor;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  final String text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.font13DarkBlueMedium.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: fontSize),
        ),
      ),
    );
  }
}
