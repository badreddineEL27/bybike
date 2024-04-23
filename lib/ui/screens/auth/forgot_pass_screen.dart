import 'package:bybike/utils/constants.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/forgot_pass_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/font_styles.dart';
import '../../widgets/general_gradient_button.dart';
import '../../widgets/general_textfield.dart';

class ForgotPassScreen extends GetView<ForgotPassScreenController> {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: Get.height * 0.1,
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
                provideYourEmailAddressForReceipt,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:40),
                child: GeneralTextField(
                  controller: controller.emailController,
                  title: "E-mail",
                  hint: eMmailUser,
                  isObsecure: false,
                ),
              ),
              SizedBox(height: Get.height * 0.16),
              const Text(
                "Assurez-vous d'avoir déjà confirmé votre adresse e-mail En appuyant sur le bouton ci-dessous, vous recevrez un e-mail contenant un code de récupération. Saisissez ce code sur la page suivante pour réinitialiser votre mot de passe",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.6,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              GradientButton(
                onTap: () async {
                  await controller.sendTOP();
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
