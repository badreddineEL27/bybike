import 'package:bybike/ui/widgets/general_gradient_button.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:bybike/utils/app_colors.dart';

import '../../../../controllers/my_account_screen_controller.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/general_textfield.dart';

class MyAccountScreen extends GetView<MyAccountScreenController> {
  const MyAccountScreen({super.key});

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
                        Padding(
                          padding: const EdgeInsets.only(left: 4, top: 16),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              CupertinoIcons.multiply,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 16, top: 12, bottom: 8),
                          child: Text(
                            "Bonjour Elon !",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 28,
                              wordSpacing: 0.8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          height: 80,
                          width: 80,
                          child: Stack(
                            children: [
                              ClipOval(
                                // bord erRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "assets/images/elon.jpg",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset(
                                  "assets/icons/edit.png",
                                  height: 24,
                                  width: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GeneralTextField(
                      controller: controller.userNameController,
                      title: "Nom",
                      hint: "Elon Ait Musk",
                      isObsecure: false,
                    ),
                    const SizedBox(height: 20),
                    GeneralTextField(
                      controller: controller.emailController,
                      title: "E-mail",
                      hint: eMmailUser,
                      isObsecure: false,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => GeneralTextField(
                        controller: controller.phoneNoController,
                        title: password,
                        hint: "+212 66666666",
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
                    Container(
                      // height: 150,
                      margin:const EdgeInsets.symmetric(vertical: 20, horizontal: 16,),
                      padding: const EdgeInsets.symmetric(horizontal:12,vertical: 12),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "RECEVOIR LES REÇUS PAR E-MAIL",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Switch(
                                value: false,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                          const Text(
                            "Restez informé(e) de nos actualités, promotions exclusives et profitez d'une expérience plus personnalisée en vous abonnant",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: kGreyolor, fontSize: 13,),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
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
                          onPressed: () {},
                          child: Image.asset('assets/icons/social_g.png'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            fixedSize: const Size.fromHeight(45),
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {},
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
