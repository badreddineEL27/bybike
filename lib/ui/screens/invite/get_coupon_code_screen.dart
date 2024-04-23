import 'package:bybike/ui/widgets/general_gradient_button.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/get_coupon_code_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/constants.dart';

class GetCouponCodeScreen extends GetView<GetCouponCodeScreenController> {
  const GetCouponCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.03),
          child: const Text(
            kInviteFriends,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              wordSpacing: 0.8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, kBackgroundColor, Colors.white24],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset("assets/images/qw.png"),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  kInviteFriendsAndGetCouponsWithEveryInvite,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_card_back.png"),
                  ),
                ),
                height: Get.height * 0.3,
                width: Get.width * 0.8,
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: Get.height * 0.06),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      kShareYourInvitationCode,
                      style: TextStyle(
                        fontSize: 12,
                        color: kGreyolor,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: kWhiteColor,
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      width: Get.width * 0.6,
                      child: const Text("H1W83@!23"),
                    ),
                    SizedBox(
                      height: 40,
                      width: Get.width * 0.6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: kWhiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(kInviteFriendScreenRoute);
                        },
                        child: const Text("INVITE FRIENDS"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
