

import 'package:bybike/controllers/account_and_settings_controller.dart';
import 'package:bybike/controllers/add_rating_screen_controller.dart';
import 'package:bybike/controllers/destination_screen_controller.dart';
import 'package:bybike/controllers/forgot_pass_screen_controller.dart';
import 'package:bybike/controllers/get_coupon_code_screen_controller.dart';
import 'package:bybike/controllers/home_screen_controller.dart';
import 'package:bybike/controllers/intro_screen_controller.dart';
import 'package:bybike/controllers/invite_friends_screen_controller.dart';
import 'package:bybike/controllers/my_account_screen_controller.dart';
import 'package:bybike/controllers/options_screen_controller.dart';
import 'package:bybike/controllers/payment_screen_controller.dart';
import 'package:bybike/controllers/reset_pass_screen_controller.dart';
import 'package:bybike/controllers/ride_history_screen_controller.dart';
import 'package:bybike/controllers/serached_location_screen_controller.dart';
import 'package:bybike/controllers/signin_screen_controller.dart';
import 'package:bybike/controllers/signup_screen_controller.dart';
import 'package:bybike/controllers/welcome_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';


class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => OptionsScreenController());
    Get.lazyPut(() => IntroScreenController());
    Get.lazyPut(() => WelcomeScreenController());
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => SignUpScreenController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => RideHistoryScreenController());
    Get.lazyPut(() => PaymentScreenController());
    Get.lazyPut(() => InviteFriendsScreenController());
    Get.lazyPut(() => GetCouponCodeScreenController());
    Get.lazyPut(() => SearchedLocationScreenController());
    Get.lazyPut(() => AccountAndSettingsScreenController());
    Get.lazyPut(() => MyAccountScreenController());
    Get.lazyPut(() => AddRatingScreenController());
    Get.lazyPut(() => ForgotPassScreenController());
    Get.lazyPut(() => ResetPassScreenController());
    Get.lazyPut(() => OptionsScreenController());
    Get.lazyPut(() => DestinationScreenController());
  }
}
