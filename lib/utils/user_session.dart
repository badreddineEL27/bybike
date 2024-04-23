import 'dart:convert';
import 'dart:developer';
import 'package:bybike/models/login_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';


class UserSession {
  static Rx<LatLng?> latLng = Rx(null);

  static final RxBool isDataChanged = RxBool(false);
  static final Rx<LoginModel> userModel = LoginModel.empty().obs;

  static final UserSession _instance = UserSession._internal();
  
  UserSession._internal();

  factory UserSession() {
    return _instance;
  }

  //
  Future<bool> createSession({required LoginModel user}) async {
    final preference = await SharedPreferences.getInstance();
    userModel.value = user;
    preference.setString('USER_DATA', jsonEncode(userModel.value.toJson()));
    return true;
  }

  //
  Future<bool> isUserLoggedIn() async {
    final preference = await SharedPreferences.getInstance();
    userModel.value = LoginModel.fromJson(jsonDecode(preference.getString('USER_DATA') ?? "{}"));
    log("----------------->${userModel.value.toJson()}");
    return userModel.value.email.isNotEmpty;
  }

  //
  Future<bool> logout() async {
    final preference = await SharedPreferences.getInstance();
    preference.remove('USER_DATA');
    return true;
  }

  String get userId =>userModel.value.uuid;
}
