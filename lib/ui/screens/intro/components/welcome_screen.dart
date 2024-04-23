// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybike/controllers/welcome_screen_controller.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bybike/controllers/intro_screen_controller.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/font_styles.dart';

import '../../../../utils/constants.dart';

class WelcomeScreen extends GetView<WelcomeScreenController> {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        height: Get.height,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background-transparent.png",
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Positioned(
                top: 0,
                left: 20,
                right: 20,
                bottom: Get.height * 0.3,
                child: Image.asset(
                  "assets/images/welcome_page_img.png",
                ),
              ),
              Positioned(
                bottom: Get.height * 0.16,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            welcomeToByBIKE,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              fontFamily: titleFontFamily,
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/logo.png",
                          height: 80,
                          width: Get.width * 0.25,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const Text(
                      selectYourLocationToStartFindingDriversNearby,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        height: 0.9,
                        fontFamily: descFontFamily,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: kWhiteColor,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Get.offNamed(kSignUpScreenRoute);
                      },
                      icon: const Icon(CupertinoIcons.location_fill),
                      label: const Text(useCurrentLocation, style: TextStyle(fontSize: 17, fontFamily: buttonFontFamily, fontWeight: FontWeight.w500),),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        selectItManually,
                        style: TextStyle(
                          color: Colors.green.shade600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.green.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
