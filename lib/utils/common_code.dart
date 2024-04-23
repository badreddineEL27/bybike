import 'dart:developer' as dev;
import 'dart:io';
import 'dart:typed_data';

import 'package:bybike/utils/app_colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

@immutable
class CommonCode {
  Future<Uint8List> readBytesFromAsset(String assetPath) async {
    try {
      ByteData data = await rootBundle.load(assetPath);
      Uint8List bytes = data.buffer.asUint8List();
      return bytes;
    } on Exception catch (e) {
      dev.log("======================${e}");
      return Uint8List(0);
    }
  }

  Future<String> getImageFromGallery(ImageSource souce) async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null && File(pickedFile.path).existsSync()) {
      return pickedFile.path;
    } else {
      print("[Error]: No image selected");
      return '';
    }
  }

  void showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xF9454141),
        textColor: Colors.white,
        fontSize: 13.0);
  }

  void showSuccessToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: kAppGreenColor,
      textColor: Colors.white,
      fontSize: 13.0,
    );
  }

  Widget showEmptyListMessage(
      {required String message,
      double heightPercentage = 0.6,
      double fontSize = 18}) {
    return SizedBox(
        height: Get.height * heightPercentage,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/empty_record.png",
                width: Get.width * 0.5,
                height: Get.height * (heightPercentage / 2),
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xffe2e2e2),
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }

  Future<bool> checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  Future<bool> checkInternetAccess() async {
    try {
      if (await checkInternetConnection()) {
        http.Response response = await http
            .get(Uri.parse("https://www.google.com/"))
            .timeout(const Duration(seconds: 10));
        return response.body.length > 4;
      }
    } catch (_) {}
    return false;
  }

  Widget showProgressIndicator(bool visibility, bool isListEmpty) {
    return visibility
        ? Visibility(
            visible: visibility,
            child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                    child: CircularProgressIndicator(
                        color: kAppGreenColor, strokeWidth: 2))))
        : Visibility(
            visible: isListEmpty,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 100),
              child: const Text(
                'No Data Found !',
                style: TextStyle(fontSize: 20, color: kAppTextWhiteColor),
              ),
            ),
          );
  }

  ///
  /// This method check for latest version on Database and Navigate user to Play Store for Update Application.
  /// - If version is necessary then Popup will not be removed until App is Updated.
  ///
  // Future<void> checkForUpdate() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String appVersion = packageInfo.version;
  //   VersionCheckModel latestVersion = await GeneralService().getVersionData();
  //   if (Platform.isAndroid && latestVersion.androidVersion.isNotEmpty) {
  //     String version = latestVersion.androidVersion;
  //     if (appVersion.compareTo(version).isNegative) {
  //       CustomDialogs().showDialog(
  //           "Version Update Available",
  //           "New version $version is available.\n${latestVersion.isNecessary?'It is Necessary to':'Please'} Update it.",
  //           DialogType.SUCCES,
  //           const Color(kPrimaryColor),
  //           dismissible: !(latestVersion.isNecessary),
  //           onOkBtnPressed: openStore);
  //     }
  //   }
  // }

  // void openStore() {
  //   launchUrl(//https://play.google.com/store/apps/details?id=pk.gos.spsu.mobileApp
  //     Uri.parse("market://details?id=pk.gos.spsu.mobileApp"),
  //     mode: LaunchMode.externalNonBrowserApplication,
  //   );
  // }

  // Future<String> saveImage({required String url,bool greaterThanEleven = false}) async {
  //   Directory? directory;
  //   String fileSavingName = "file.pdf";
  //   String newPath = "";
  //   try {
  //     if (Platform.isAndroid) {
  //       String appendDate = "${DateTime.now().microsecond}";
  //       if (await requestPermission(Permission.storage)) {
  //         directory = await getExternalStorageDirectory();
  //         List<String> paths = directory!.path.split("/");
  //         List<String> urlList = url.split("/");
  //         // String downloadFileName = urlList.last;
  //         // fileSavingName = "${downloadingModelList[indexOfCurrentFileBeingDownloaded].bankTransactionNoOfFile.value}"+"_${appendDate}_"+urlList.last;
  //         fileSavingName = "_${appendDate}_${urlList.last}";
  //         for (int x = 1; x < paths.length; x++) {
  //           String folder = paths[x];
  //           if (folder != "Android") {
  //             newPath += "/$folder";
  //           } else {
  //             break;
  //           }
  //         }
  //         if (!greaterThanEleven) {
  //           newPath = "$newPath/Download/SFERPApp";
  //         }else{
  //           newPath = "$newPath/Download/";
  //         }
  //         directory = Directory(newPath);
  //       } else {
  //         return "";
  //       }
  //     } else {
  //       if (await requestPermission(Permission.photos)) {
  //         directory = await getTemporaryDirectory();
  //       } else {
  //         return "";
  //       }
  //     }
  //     File saveFile = File("${directory.path}/$fileSavingName");
  //     if (!await directory.exists()) {
  //       await directory.create(recursive: true);
  //     }
  //     if (await directory.exists()) {
  //       //downloading
  //       var response =await http.get(Uri.parse(url));
  //       saveFile.writeAsBytes(response.bodyBytes);
  //       //downloaded
  //       //for ios
  //       // if (Platform.isIOS) {
  //       //   await ImageGallerySaver.saveFile(saveFile.path,
  //       //       isReturnPathOfIOS: true);
  //       // }
  //       return "$newPath/$fileSavingName";
  //     }
  //     return "";
  //   } catch (e) {
  //     return "";
  //   }
  // }

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  getExternalStorageDirectory() {}

// Function to calculate the distance between two coordinates using the Haversine formula
  double calculateDistanceBetweenTwoCordniates(
      double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371.0; // Earth radius in kilometers
    double dLat = (lat2 - lat1) * (pi / 180.0);
    double dLon = (lon2 - lon1) * (pi / 180.0);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * (pi / 180.0)) *
            cos(lat2 * (pi / 180.0)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;
    return distance;
  }

  List<LatLng> generateCoordinates(double startLat, double startLon) {
    List<LatLng> coordinates = [];
    const double targetDistance =
        1.0; // Target distance between coordinates in kilometers
    double currentLat = startLat;
    double currentLon = startLon;

    // Generate 10 coordinates
    for (int i = 0; i < 10; i++) {
      // Incrementally adjust longitude to maintain approximately 1 km distance
      double newLon = currentLon +
          (360.0 *
              (targetDistance /
                  (2 * pi * 6371.0) /
                  cos(
                    currentLat * (pi / 180.0),
                  )));
      coordinates.add(LatLng(currentLat, newLon));
      currentLon = newLon;
    }

    return coordinates;
  }
}
