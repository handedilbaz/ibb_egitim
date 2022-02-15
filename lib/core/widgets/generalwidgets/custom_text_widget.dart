import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key key,
      this.label,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.textAlign})
      : super(key: key);

  final String label;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        textAlign: textAlign,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize));
  }
}
