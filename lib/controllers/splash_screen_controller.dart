import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/route_names.dart';
import '../utils/user_session.dart';

class SplashScreenController extends GetxController{

  late Timer _timer;

  @override
  void onInit() {
   _timer = Timer(const Duration(seconds: 5), () {
      whereToGo();
    });
    super.onInit();
  }

  void whereToGo() async {
    // var sharedPref = await SharedPreferences.getInstance();
    // var isAuthDone = sharedPref.getBool("is_auth_done")??false;

    // var isNewUser = sharedPref.getBool("isNewUser")??true;


        // if(isNewUser) {
        //   Get.offNamed(kOptionsScreenRoute);
        // } else {
        //   if (UserSession.userModel.value.email.isNotEmpty) {
        //     if (isAuthDone) {
        //       Get.offNamed(kHomeScreenRoute);
        //     } else {
        //       // Get.offNamed(kGoogleAuthScreenRoute);
        //     }
        //   } else {
        //     Get.offNamed(kIntroScreenRoute);
        //   }
        // }  
        Get.offNamed(kOptionsScreenRoute);
  }

  void onScreenTap() {
    _timer.cancel();
    whereToGo();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}