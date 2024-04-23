import 'package:get/get.dart';
import 'package:flutter/material.dart';

/// Created By: Amjad Jamali on 7-Aug-2023

class ProgressDialog {
  static final ProgressDialog _instance = ProgressDialog._internal();
  ProgressDialog._internal();
  factory ProgressDialog() => _instance;

  bool _isShowing = false;
  String _t = '';

  void showDialog({String? title}) {
    if(_isShowing) return;
    _t = DateTime.now().toString();
    _autoClose(_t);
    _isShowing = true;
    Get.defaultDialog(
        title: "",
        titleStyle: const TextStyle(height: 0.0),
        content: Container(
          margin: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 15,
              ),
              Text(
                title ?? 'Please wait...',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        barrierDismissible: true,
        onWillPop: () {
          return Future.value(false);
        },
        radius: 10);
  }

  void dismissDialog() {
    if (_isShowing) {
      _isShowing = false;
      Get.back();
    }
  }

  Future<void> _autoClose(String t) async {
    await Future.delayed(const Duration(seconds: 60));
    if(_isShowing && _t==t) {dismissDialog();}
  }

  bool get isOpened => _isShowing;

}
