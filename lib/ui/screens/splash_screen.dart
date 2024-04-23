import 'package:bybike/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GestureDetector(
        onTap: controller.onScreenTap,
        child: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          filterQuality: FilterQuality.high,
                          image: AssetImage(
                              "assets/images/background-transparent.png"),
                        ),
                      ),
                      // child: Image.asset("assets/images/background.png"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          filterQuality: FilterQuality.high,
                          image: AssetImage(
                              "assets/images/background-transparent.png"),
                        ),
                      ),
                      // child: Image.asset("assets/images/background.png"),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icons/logo.png',
                height:  Get.width * 0.6,
                width: Get.width * 0.6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
