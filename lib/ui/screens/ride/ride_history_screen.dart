import 'package:bybike/controllers/ride_history_screen_controller.dart';
import 'package:bybike/models/ride_history_model.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import 'components/ride_history_card.dart';

class RideHistoryScreen extends GetView<RideHistoryScreenController> {
  const RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:16, top: 12),
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: buttonColor1,
                foregroundColor: kWhiteColor,
                shape: CircleBorder(),
              ),
              onPressed: () {
                // Get.offAllNamed(kOptionsScreenRoute);
              },
              icon: const Icon(
                Icons.card_travel,
              ),
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                kHistory,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 28,
                  wordSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: double.maxFinite,
              height: Get.height,
              child: const Image(
                image: AssetImage(
                  "assets/images/background-transparent.png",
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Obx(
                  () => Column(
                    children: [
                      for (int index = 0;
                          index < controller.rideHistory.length;
                          index++)
                        RideHistoryCard(
                          history: controller.rideHistory[index],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
