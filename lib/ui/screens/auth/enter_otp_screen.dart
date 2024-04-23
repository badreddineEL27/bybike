import 'package:bybike/controllers/enter_otp_screen_controller.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/route_names.dart';
import '../../widgets/general_gradient_button.dart';

class EnterOtpScreen extends GetView<EnterOtpScreenController> {
  const EnterOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.maxFinite,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background-transparent.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                forgotPasswordRecovery,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 28,
                  wordSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                enterTheRecoveryCodeYouReceived,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14, color: Colors.black45, letterSpacing: 0.01),
              ),
              SizedBox(height: Get.height * 0.16),
              const Align(
                alignment: Alignment.center,
                child: Pinput(
                  defaultPinTheme: PinTheme(
                    height: 54,
                    width: 54,
                    textStyle: TextStyle(fontSize: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: kGreyolor,)
                      )
                    )
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.16),
              GradientButton(
                onTap: () {
                  Get.toNamed(kResetPassScreenRoute);
                },
                gradientColors: const [
                  buttonColor1,
                  Colors.green,
                ],
                buttonText: getTheCode,
                textColor: kWhiteColor,
                fontFamily: buttonFontFamily,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
