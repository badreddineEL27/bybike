import 'package:bybike/ui/widgets/general_textfield.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/reset_pass_screen_controller.dart';
import '../../../utils/constants.dart';
import '../../widgets/general_gradient_button.dart';

class ResetPassScreen extends GetView<ResetPassScreenController> {
  const ResetPassScreen({super.key});

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
                "Nouveau mot de \npasse",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 28,
                  wordSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                enterYourNewPassword,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                  letterSpacing: 0.01,
                ),
              ),
              SizedBox(height: Get.height * 0.16),
              Obx(
                () => GeneralTextField(
                  controller: controller.passwordController,
                  title: newPassword,
                  hint: "* * * * * * * *",
                  isObsecure: controller.showPass.value,
                  suffix: GestureDetector(
                    onTap: () {
                      controller.onObsecurePassChange();
                    },
                    child: controller.showPass.value
                        ? const Icon(
                            Icons.remove_red_eye,
                          )
                        : const Icon(CupertinoIcons.eye_slash_fill),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => GeneralTextField(
                  controller: controller.confrimPasswordController,
                  title: confrim,
                  hint: "* * * * * * * *",
                  isObsecure: controller.showConfrimPass.value,
                  suffix: GestureDetector(
                    onTap: () {
                      controller.onObsecureConfrimPassChange();
                    },
                    child: controller.showConfrimPass.value
                        ? const Icon(
                            Icons.remove_red_eye,
                          )
                        : const Icon(CupertinoIcons.eye_slash_fill),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.16),
              GradientButton(
                onTap: () {
                  Get.toNamed(kSignInScreenRoute);
                },
                gradientColors: const [
                  buttonColor1,
                  Colors.green,
                ],
                buttonText: confrim,
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
