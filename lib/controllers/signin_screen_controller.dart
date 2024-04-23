import 'dart:developer';

import 'package:bybike/models/login_model.dart';
import 'package:bybike/services/firebase_service.dart';
import 'package:bybike/utils/common_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/custom_progress_dialog.dart';
import '../utils/route_names.dart';
import '../utils/user_session.dart';

class SignInScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();

  RxBool showPass = RxBool(false);

  RxBool isLoading = RxBool(false);

  void onObsecurePassChange() {
    showPass.value = !showPass.value;
    notifyChildrens();
  }

  Future<void> signInWithFacebook() async {
    ProgressDialog pd = ProgressDialog();
    pd.showDialog();
    final LoginResult loginResult = await FacebookAuth.instance.login();
    pd.dismissDialog();
    if (loginResult.status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;
      print('Facebook User ID: ${accessToken.userId}');
      final userData = await FacebookAuth.instance.getUserData();
      log('${userData['name']}');
    } else {
      print('Facebook login failed: ${loginResult.status}');
    }
  }

  signInWithGoogle() async {
    try {
      ProgressDialog pd = ProgressDialog();
      pd.showDialog();
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      pd.dismissDialog();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken);
      UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
      log('${user.user?.displayName}');
      if(user.user != null) {
        Get.toNamed(kHomeScreenRoute);
      }
    } catch (e) {
      log('$e');
    }
  }

   void onLogin()async{
    print('-------------:::::1');
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
    ProgressDialog pd = ProgressDialog();
    bool checkInternet = await CommonCode().checkInternetConnection();
    if(checkInternet){
      pd.showDialog();
      LoginModel loginModel = LoginModel(
        uuid: "", 
        email: emailController.text.trim(), 
        password: passwordController.text.trim()
      );

        String response = await FirebaseService().loginUser(loginModel);
        pd.dismissDialog();
        if(response == "Sucess"){
          print('--------------------:::::::::::::::::::::2: $response');
          await UserSession().createSession(user: loginModel);
          Get.toNamed(kHomeScreenRoute);

        }
        else{
          CommonCode().showToast(message:"Invalid credentials!");
        }
      }else{
        CommonCode().showToast(message:"No Internet is available!");
      }
      }else{
        CommonCode().showToast(message:"please enter credentials properly!");
        return;
      }

    notifyChildrens();
  }
}
