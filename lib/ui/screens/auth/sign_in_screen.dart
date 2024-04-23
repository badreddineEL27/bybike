// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybike/controllers/signin_screen_controller.dart';
import 'package:bybike/ui/screens/home/home_screen.dart';
import 'package:bybike/ui/widgets/general_gradient_button.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:bybike/utils/app_colors.dart';

import '../../../utils/constants.dart';
import '../../../utils/route_names.dart';
import '../../widgets/general_textfield.dart';

class SignInScreen extends GetView<SignInScreenController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: kBackgroundColor,
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
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 4),
                        IconButton(
                          onPressed: () {
                            Get.offAllNamed(kOptionsScreenRoute);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      appLogo,
                      width: Get.width * 0.4,
                      filterQuality: FilterQuality.high,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12, top: 12),
                        child: Text(
                          welcomeBack,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: defaultFontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text(
                              dontHaveAccount,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: authTitleFontFamily
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(kSignUpScreenRoute);
                              },
                              child: const Text(
                                registerNow,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily:authTitleFontFamily,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    GeneralTextField(
                      controller: controller.emailController,
                      title: "E-mail",
                      hint: eMmailUser,
                      isObsecure: false,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => GeneralTextField(
                        controller: controller.passwordController,
                        title: password,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text(
                              rememberMe,
                              style: TextStyle(
                                fontFamily: labelFontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 13
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(kForgotPassScreenRoute);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              forgotPassword,
                              style: TextStyle(
                                fontFamily: labelFontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 13
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.05),
                    GradientButton(
                      onTap: () {
                        controller.onLogin();
                        //TODO: Navigate to Home or map Screen
                        // Get.offAllNamed(kHomeScreenRoute);
                        
                      },
                      gradientColors: const [
                        Colors.green,
                        buttonColor1,
                        Colors.green,
                      ],
                      buttonText: register,
                      textColor: kWhiteColor,
                      fontFamily: buttonFontFamily,
                    ), 
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Get.width * 0.1,
                          height: 1,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: buttonColor2,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const Text(or),
                        Container(
                          width: Get.width * 0.1,
                          height: 1,
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                            color: buttonColor2,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            fixedSize: const Size.fromHeight(45),
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {
                            controller.signInWithGoogle();
                          },
                          child: Image.asset('assets/icons/social_g.png'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            fixedSize: const Size.fromHeight(45),
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {
                            print('facebookk sign in');
                            controller.signInWithFacebook();

                          },
                          child: Image.asset('assets/icons/social_f.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
