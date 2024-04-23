import 'package:bybike/models/login_model.dart';
import 'package:bybike/utils/custom_progress_dialog.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firebase_service.dart';
import '../utils/common_code.dart';

class SignUpScreenController extends GetxController{
  RxBool isLoading = RxBool(false);
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


  Future<void> onSubmit()async{
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty&& confrimPasswordController.text.isNotEmpty){
    ProgressDialog pd = ProgressDialog();
    bool checkInternet = await CommonCode().checkInternetConnection();
    if(passwordController.text.trim() != confrimPasswordController.text.trim()){
          CommonCode().showToast(message: "Passwords donnot match!");
          return;
    }
    if(checkInternet){
      pd.showDialog();
      LoginModel loginModel = LoginModel(uuid: "", email: emailController.text.trim(), password: passwordController.text.trim());
      String response = await FirebaseService().register(loginModel);
      pd.dismissDialog();
        if(response == "Sucess"){
          CommonCode().showToast(message:"You have Registered Successfully.");
           Get.toNamed(kSignInScreenRoute);
        }else if(response == "email-already-in-use"){
          CommonCode().showToast(message:"Email Already Exists, Try Another!");
        }else if(response == "OTHER"){
          CommonCode().showToast(message:"Something went wrong. Try Again!");
        }
      else if(response=='[firebase_auth/weak-password] Password should be at least 6 characters'){
        CommonCode().showToast(message:'please enter a strong password');
      }
    }else{
      CommonCode().showToast(message:"No Internet is available!");
    }}else{
      CommonCode().showToast(message:"please enter credentials properly!");
      return;
    }

  }
  
}