import 'package:bybike/ui/widgets/general_gradient_button.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/constants.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controllers/payment_screen_controller.dart';
import '../../../utils/route_names.dart';

class PaymentScreen extends GetView<PaymentScreenController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.02),
              alignment: Alignment.topCenter,
              width: double.maxFinite,
              height: Get.height,
              child: const Image(
                image: AssetImage(
                  "assets/images/bgimg.png",
                ),
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      child: Text(
                        kPayment,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 32,
                          wordSpacing: 0.8,
                          fontFamily: defaultFontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Text(
                        kCurrentMethod,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: buttonFontFamily,
                          color: kGreyolor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 4),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tileColor: kWhiteColor,
                        leading: Image.asset(
                          "assets/icons/vt.png",
                          height: 40,
                          width: 40,
                        ),
                        title: const Text(
                          kCashPayment,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontFamily: defaultFontFamily
                          ),
                        ),
                        subtitle: const Text(
                          kDefaultMethod,
                          style: TextStyle(
                            fontSize: 12,
                            color: kGreyolor,
                            fontWeight: FontWeight.w500,
                            fontFamily: buttonFontFamily
                          ),
                        ),
                        trailing: Image.asset(
                          'assets/icons/tick_green_circle.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 48,
                margin: EdgeInsets.only(bottom: Get.height * 0.1),
                child: GradientButton(
                  onTap: () {
                    Get.back(result: true);
                  },
                  gradientColors: [buttonColor1, Colors.green],
                  buttonText: kAccept,
                  textColor: kWhiteColor,
                  fontFamily: buttonFontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
