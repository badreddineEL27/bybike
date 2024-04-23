import 'package:bybike/services/firebase_service.dart';
import 'package:bybike/utils/common_code.dart';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/route_names.dart';

class ForgotPassScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();

  sendTOP() async {
    if(emailController.text.trim().isEmpty || !emailController.text.trim().isEmail) {
      CommonCode().showToast(message: "Please enter valid email");
      return;
    }
    String result = await FirebaseService().sendPasswordResetEmail(emailController.text.trim());
    if(result =="Success") {
      Get.toNamed(kEnterOtpScreenRoute);
    }
  }
  
}
