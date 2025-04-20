import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.title,
    this.fSize,
    this.fontWeight,
    this.color,
  });

  final String title;
  final double? fSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
