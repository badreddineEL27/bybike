import 'package:bybike/controllers/intro_screen_controller.dart';
import 'package:bybike/ui/screens/intro/components/item_page.dart';
import 'package:bybike/ui/screens/intro/components/welcome_screen.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/font_styles.dart';

class IntroScreen extends GetView<IntroScreenController> {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background-transparent.png",
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Get.height * 0.05),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 12),
                    child: TextButton(
                      onPressed: () {
                        Get.offNamed(kWelcomeScreenRoute);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                items: [
                  ItemPage(
                    title: easyBooking,
                    desc: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Facilitez vos déplacements avec  ",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                height: 1,
                                letterSpacing: 0.1,
                                fontFamily: descFontFamily,
                              ),
                            ),
                            Image.asset(
                              "assets/icons/logo.png",
                              height: 30,
                              width: Get.width * 0.17,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        const Text(
                          "Réservez rapidement et partez à l'aventure",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 21,
                            height: 1,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500,
                            fontFamily: descFontFamily,
                          ),
                        ),
                        const Text(
                          "en toute simplicité",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            height: 1,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500,
                            fontFamily: descFontFamily,
                          ),
                        ),
                      ],
                    ),
                    imageUrl: "assets/images/page_first.png",
                  ),
                  ItemPage(
                    title: checkYourRoute,
                    desc: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Navigatez sans effort, roulez en toute confiance",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            height: 1,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500,
                            fontFamily: descFontFamily,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/logo.png",
                              height: 30,
                              width: Get.width * 0.16,
                              fit: BoxFit.contain,
                            ),
                            const Text(
                              " votre partenaire pour des trajets en moto",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: 21,
                                height: 1,
                                letterSpacing: 0.1,
                                fontFamily: descFontFamily,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "sans stress.",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            height: 1,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500,
                            fontFamily: descFontFamily,
                          ),
                        ),
                      ],
                    ),
                    imageUrl: "assets/images/page_second.png",
                  ),
                  ItemPage(
                    title: quickResponses,
                    desc: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Drivers réactifs, trajets sans attente.",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            height: 1,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500,
                            fontFamily: descFontFamily,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Profitez de réponses rapides avec ",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                height: 1,
                                letterSpacing: 0.1,
                                fontFamily: descFontFamily,
                              ),
                            ),
                            Image.asset(
                              "assets/icons/logo.png",
                              height: 30,
                              width: Get.width * 0.16,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        const Text(
                          "spour des déplacements efficients et sans délai.",
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            height: 1,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500,
                            fontFamily: descFontFamily,
                          ),
                        ),
                      ],
                    ),
                    imageUrl: "assets/images/page_third.png",
                  )
                ],
                options: CarouselOptions(
                  height: Get.height * 0.75,
                  // aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: controller.onIndexChanged,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              // const SizedBox(height: 20.0),
              Obx(
                () => controller.currentIndex.value !=
                        controller.items.length - 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.items.map((img) {
                          int index = controller.items.indexOf(img);
                          return Container(
                            width: 16,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: controller.currentIndex.value == index
                                  ? buttonColor2
                                  : Colors.grey,
                            ),
                          );
                        }).toList(),
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.offNamed(kWelcomeScreenRoute);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            bottom: Get.height * 0.16,
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
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
                            ]
                          ),
                          child: const Text(
                            "Continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: kWhiteColor,
                              fontFamily: buttonFontFamily,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
