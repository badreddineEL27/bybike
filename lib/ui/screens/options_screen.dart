import 'package:bybike/controllers/options_screen_controller.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class OptionsScreen extends GetView<OptionsScreenController> {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background-transparent.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/first_ride.png",
                height: Get.height * 0.4,
                // width: Get.height * 0.4,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: Get.height * 0.14,
              ),
              Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kIntroScreenRoute);
                      },
                      child: Container(
                        width: Get.width * 0.9,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.green,
                                buttonColor1,
                                buttonColor2,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white38,
                                blurRadius: 1,
                                spreadRadius: 1,
                              )
                            ]),
                        child: const Text(
                          findaMotorcycleCarpool,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: kWhiteColor,
                            fontFamily: buttonFontFamily,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        width: Get.width * 0.9,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.green,
                                buttonColor1,
                                buttonColor2,
                              ],
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white38,
                                blurRadius: 1,
                                spreadRadius: 1,
                              )
                            ]),
                        child: const Text(
                          becomeADriver,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: kWhiteColor,
                            fontFamily: buttonFontFamily,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
