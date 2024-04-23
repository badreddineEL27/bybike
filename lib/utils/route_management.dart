
import 'package:bybike/ui/screens/account/account_and_settings_screen.dart';
import 'package:bybike/ui/screens/account/my_account/my_account_screen.dart';
import 'package:bybike/ui/screens/auth/enter_otp_screen.dart';
import 'package:bybike/ui/screens/auth/forgot_pass_screen.dart';
import 'package:bybike/ui/screens/auth/reset_pass_screen.dart';
import 'package:bybike/ui/screens/auth/sign_in_screen.dart';
import 'package:bybike/ui/screens/auth/sign_up_screen.dart';
import 'package:bybike/ui/screens/home/components/destination_screen.dart';
import 'package:bybike/ui/screens/home/home_screen.dart';
import 'package:bybike/ui/screens/intro/components/welcome_screen.dart';
import 'package:bybike/ui/screens/home/components/searched_location_screen.dart';
import 'package:bybike/ui/screens/intro/intro_screen.dart';
import 'package:bybike/ui/screens/invite/get_coupon_code_screen.dart';
import 'package:bybike/ui/screens/invite/invite_friends_screen.dart';
import 'package:bybike/ui/screens/options_screen.dart';
import 'package:bybike/ui/screens/payment/payment_screen.dart';
import 'package:bybike/ui/screens/rating/add_rating_screen.dart';
import 'package:bybike/ui/screens/ride/ride_history_screen.dart';
import 'package:bybike/ui/screens/splash_screen.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:get/get.dart';

import 'screen_bindings.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kSplashScreenRoute,
        page: () => const SplashScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kOptionsScreenRoute,
        page: () => const OptionsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kIntroScreenRoute,
        page: () => const IntroScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kWelcomeScreenRoute,
        page: () => const WelcomeScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSignInScreenRoute,
        page: () => const SignInScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSignUpScreenRoute,
        page: () => const SignUpScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kHomeScreenRoute,
        page: () => const HomeScreen(),
        binding: ScreensBindings(),
      ),

      //Ride
      GetPage(
        name: kRideHistoryScreenRoute,
        page: () => const RideHistoryScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kPaymentScreenRoute,
        page: () => const PaymentScreen(),
        binding: ScreensBindings(),
      ),
      //Invite Friends
      GetPage(
        name: kGetCouponCodeScreenRoute,
        page: () => const GetCouponCodeScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kInviteFriendScreenRoute,
        page: () => const InviteFriendsScreen(),
        binding: ScreensBindings(),
      ), GetPage(
        name: kSearchedLocationScreenRoute,
        page: () => const SearchedLocationScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kAccountAndSettingsScreenRoute,
        page: () => const AccountAndSettingsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kMyAccountScreenRoute,
        page: () => const MyAccountScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kAddRatingScreenRoute,
        page: () => const AddRatingScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kForgotPassScreenRoute,
        page: () => const ForgotPassScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kResetPassScreenRoute,
        page: () => const ResetPassScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kEnterOtpScreenRoute,
        page: () => const EnterOtpScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kDestinationScreenRoute,
        page: () => const DestinationScreen(),
        binding: ScreensBindings(),
      ),

    ];
  }
}
