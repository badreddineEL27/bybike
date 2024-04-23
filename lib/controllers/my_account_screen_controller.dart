import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountScreenController extends GetxController{
  TextEditingController emailController = TextEditingController(text: "Elon Ait Musk");
  TextEditingController userNameController = TextEditingController(text: "user@e-polytechnique.ma");
  TextEditingController phoneNoController = TextEditingController(text: "+212 66666666");

  RxBool showPass = RxBool(false);

  void onObsecurePassChange() {
    showPass.value = !showPass.value;
    notifyChildrens();
  }
  
}
