import 'dart:developer';

import 'package:bybike/services/firebase_service.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controllers/account_and_settings_controller.dart';
import 'terms/terms_and_conditions_screen.dart';

class AccountAndSettingsScreen
    extends GetView<AccountAndSettingsScreenController> {
  const AccountAndSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade700, Colors.green],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      CupertinoIcons.multiply,
                      color: kWhiteColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipOval(
                // bord erRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/elon.jpg",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kMyAccountScreenRoute);
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Elon Ait Musk",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                            fontFamily: defaultFontFamily,
                          ),
                        ),
                        Text(
                          "+212 66666666",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: defaultFontFamily,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.arrow_forward_ios,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: Get.width * 0.25),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        log("------------------->${FirebaseAuth.instance.currentUser}");
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.home_outlined),
                          SizedBox(width: 10),
                          Text(
                            "Accueil",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: defaultFontFamily,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kPaymentScreenRoute);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.payment),
                          SizedBox(width: 10),
                          Text(
                            "Mon paiement",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: defaultFontFamily,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kRideHistoryScreenRoute);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.history),
                          SizedBox(width: 10),
                          Text(
                            "Historique",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: defaultFontFamily,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kGetCouponCodeScreenRoute);
                      },
                      child: const Row(
                        children: [
                          Icon(CupertinoIcons.gift),
                          SizedBox(width: 10),
                          Text(
                            "Inviter des amis",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: defaultFontFamily,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        Get.to(const TermsAndConditionScreen());
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.privacy_tip_outlined),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              "Conditions et Politique de confidentialité",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: defaultFontFamily,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Icon(Icons.security_outlined),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Sécurité",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: defaultFontFamily,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Icon(Icons.call_outlined),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Contactez-nous",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: defaultFontFamily,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () async {
                        bool result = await FirebaseService().logOut();
                        if(result) {
                          Get.offAllNamed(kSignInScreenRoute);
                        }
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.logout_outlined),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              "Déconnexion",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: defaultFontFamily,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),                    
                    const SizedBox(height: 24),
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
