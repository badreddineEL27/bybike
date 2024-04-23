import 'package:bybike/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/font_styles.dart';

class GeneralTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool isObsecure;
  final Widget? suffix;
  final Widget? prefix;
  final double hPadding;
  final double vPadding;
  const GeneralTextField({
    Key? key,
    required this.controller,
    required this.title,
    required this.hint,
    required this.isObsecure,
    this.hPadding = 4,
    this.vPadding = 4,
    this.suffix,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: labelFontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            controller: controller,
            obscureText: isObsecure,
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 13),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: buttonColor1,
                ),
              ),
              prefix: prefix,
              suffixIcon: suffix,
              constraints: BoxConstraints(
                maxHeight: 45,
                maxWidth: Get.width * 0.92,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
