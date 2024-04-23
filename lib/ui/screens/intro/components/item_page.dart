import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bybike/utils/font_styles.dart';


class ItemPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Widget desc;
  const ItemPage({
    Key? key,
    required this.title,
    required this.desc,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Positioned(
              top: Get.height * 0.01,
              left: 8,
              right: 8,
              bottom: Get.height * 0.32,
              child: Image.asset(
                imageUrl,
              ),
            ),
            Positioned(
              bottom: Get.height * 0.09,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: titleFontFamily,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: desc,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
