import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassScreenController extends GetxController{
  RxBool showPass = RxBool(false);
  RxBool showConfrimPass = RxBool(false);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();

  void onObsecurePassChange() {
    showPass.value = !showPass.value;
    notifyChildrens();
  }
  void onObsecureConfrimPassChange() {
    showConfrimPass.value = !showConfrimPass.value;
    notifyChildrens();
  }
  
}