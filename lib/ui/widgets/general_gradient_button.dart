// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onTap;
  final List<Color> gradientColors;
  final String buttonText;
  final Color textColor;
  final String fontFamily;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;
  final double borderRadius;
  const GradientButton({
    Key? key,
    required this.onTap,
    required this.gradientColors,
    required this.buttonText,
    required this.textColor,
    required this.fontFamily,
    this.margin,
    this.padding,
    this.alignment = Alignment.center,
    this.borderRadius = 30.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.92,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        alignment: alignment,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              colors: gradientColors,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.white38,
                blurRadius: 1,
                spreadRadius: 1,
              )
            ]),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}
