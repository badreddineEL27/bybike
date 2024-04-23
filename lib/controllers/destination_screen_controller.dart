import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:math' as math;

import 'package:bybike/helpers/map_helper.dart';
import 'package:bybike/utils/common_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/ride_possibilities_model.dart';
import '../utils/serve.dart';

class DestinationScreenController extends GetxController {
  RxBool ridePlaced = RxBool(false);

  RxString distance = RxString('');
  RxString duration = RxString('');

  Completer<GoogleMapController> mapController = Completer();

  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(31.0084, -6.8539), zoom: 14.0);

  BitmapDescriptor sourseLocIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationLocIcon = BitmapDescriptor.defaultMarker;

  LatLng sourseLocation = const LatLng(25.403777, 68.269242);
  LatLng? currentLocation;
  LatLng destinationLocation =
      const LatLng(25.42028564637291, 68.26451010151374);

  RxList<Marker> markers = <Marker>[].obs;
  RxList<Polyline> polyLines = <Polyline>[].obs;

  RxList<LatLng> polylinesCordinates = <LatLng>[].obs;

  List<RidePossibilitiesModel> rideList = [
    RidePossibilitiesModel(
      id: '1',
      ride: 'Scooter',
      gender: 'Conductrice',
      price: '10.00 Dh',
      time: '1-10 min',
    ),
    RidePossibilitiesModel(
      id: '2',
      ride: 'Bike',
      gender: 'Conducteur',
      price: '14.00 Dh',
      time: '1-5 min',
    ),
    RidePossibilitiesModel(
      id: '3',
      ride: 'Bike',
      gender: 'Conducteur',
      price: '14.00 Dh',
      time: '1-5 min',
    ),
    RidePossibilitiesModel(
      id: '4',
      ride: 'Scooter',
      gender: 'Conductrice',
      price: '10.00 Dh',
      time: '1-10 min',
    ),
  ];

  GlobalKey possibilitiesSheetKey = GlobalKey(debugLabel: "PossibilitiesKey");

  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments ?? {};
    LatLng? sourcLatLng = args['sourceLoc'];
    LatLng? destinLatLng = args['destinationLoc'];
    if (sourcLatLng != null) {
      sourseLocation = sourcLatLng;
    }
    if (destinLatLng != null) {
      destinationLocation = destinLatLng;
    }
    getUserCurrentLocation();
    loadMarkers();
    loadOtherMarkers();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await loadPolylines();
  }

  loadMarkers() async {
    try {
      Size size = const Size.square(8);
      Uint8List sBytes =
          await CommonCode().readBytesFromAsset("assets/icons/complet.png");
      Uint8List dBytes =
          await CommonCode().readBytesFromAsset("assets/icons/blue_marker.png");
      if (sBytes.isNotEmpty) {
        sourseLocIcon = BitmapDescriptor.fromBytes(
          sBytes,
          size: size,
        );
      }
      if (dBytes.isNotEmpty) {
        destinationLocIcon = BitmapDescriptor.fromBytes(
          dBytes,
          size: size,
        );
      }
      loadOtherMarkers();
    } on Exception catch (e) {
      log("~~~~~~~~~~~~~${e}");
      // sourseLocIcon = BitmapDescriptor.defaultMarker;
      // destinationLocIcon = BitmapDescriptor.defaultMarker;
    }
    if (sourseLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('1'),
          position: sourseLocation,
          icon: sourseLocIcon,
        ),
      );
    }
    if (destinationLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId("2"),
          position: destinationLocation,
          icon: destinationLocIcon,
        ),
      );
    }

    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(sourseLocation.latitude, sourseLocation.longitude),
      zoom: 14,
    );
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<void> loadPolylines() async {
    PolylinePoints polylinePoints = PolylinePoints();
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        dummy,
        PointLatLng(sourseLocation.latitude, sourseLocation.longitude),
        PointLatLng(
          destinationLocation.latitude,
          destinationLocation.longitude,
        ),
      );
      distance.value = result.distance ?? "";
      duration.value = result.duration ?? "";

      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylinesCordinates.add(
            LatLng(
              point.latitude,
              point.longitude,
            ),
          );
        }
      }
      polyLines.add(
        Polyline(
          color: const Color.fromARGB(255, 7, 194, 16),
          width: 5,
          polylineId: const PolylineId("route1"),
          points: polylinesCordinates,
        ),
      );
      polyLines.refresh();
      notifyChildrens();
    } on Exception catch (e) {
      log("-----=======---------${e}");
    }
  }

  loadMyLocation() async {
    Position position = await getCurrentPosition();
    currentLocation = LatLng(position.latitude, position.longitude);
  }

  Future<Position> getCurrentPosition() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      if (kDebugMode) {
        print("ERROR$error");
      }
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getUserCurrentLocation() async {
    Uint8List sBytes = await CommonCode().readBytesFromAsset(
      "assets/icons/complet2.png",
    );
    print('getting current location');
    getCurrentPosition().then((value) async {
      log("========>${value.latitude}, ${value.longitude}");
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      markers.add(
        Marker(
          markerId: const MarkerId("3"),
          position: LatLng(value.latitude, value.longitude),
          icon: currentLocIcon,
          // icon: BitmapDescriptor.fromBytes(
          //   sBytes,
          //   size: const Size.square(8),
          // ),
        ),
      );
      markers.refresh();
    });
  }

  loadOtherMarkers() async {
    try {
      Size size = const Size.square(8);
      Uint8List sBytes = await CommonCode().readBytesFromAsset(
        "assets/icons/redbike.png",
      );
      List<LatLng> cooo = MapHelper().getCordinatesLst(sourseLocation.latitude,
          sourseLocation.longitude, 6, math.Random().nextDouble() + 5);
      for (var co in cooo) {
        log("--------------->${co}");
        markers.add(
          Marker(
            markerId: MarkerId("Bike${cooo.indexOf(co)}"),
            position: co,
            icon: BitmapDescriptor.fromBytes(sBytes, size: size),
          ),
        );
      }
    } on Exception catch (e) {
      log("~~~~~~~~~~~~~${e}");
      // sourseLocIcon = BitmapDescriptor.defaultMarker;
      // destinationLocIcon = BitmapDescriptor.defaultMarker;
    }
    markers.refresh();
  }
}
