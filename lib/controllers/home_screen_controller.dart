import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bybike/services/geocoding_service.dart';
import 'package:bybike/utils/common_code.dart';
import 'package:bybike/utils/serve.dart';
import 'package:bybike/utils/user_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_places_autocomplete_widgets/model/place.dart';
// import 'package:google_maps_webservice/places.dart';
import '../models/location_names_model.dart';
import '../models/ride_possibilities_model.dart';

class HomeScreenController extends GetxController {
  RxString currentAddress = RxString('Ma position actuelle');

  Completer<GoogleMapController> mapController = Completer();

  RxBool isHovered = false.obs;

  TextEditingController searchController = TextEditingController();

  final searchFocusNode = FocusNode();

  BitmapDescriptor sourseLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationLocationIcon = BitmapDescriptor.defaultMarker;

  Rx<CameraPosition> initialCameraPosition = const CameraPosition(
    target: LatLng(
      31.776665,
      -6.796989,
    ),
    zoom: 12.0,
  ).obs;

  RxList<Marker> markers = <Marker>[
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.42796133580664, -122.085749655962),
    ),
  ].obs;

  List<LocationName> dummyLocationNames = [
    LocationName(
      id: '1',
      locationName: 'Parakids Agadir',
      desc: 'Dcheira El Jihadia, Agadir 80000',
    ),
    LocationName(
      id: '2',
      locationName: 'Cafe Cocoperia',
      desc: 'CF3G+Q5X, Agadir 80000',
    ),
    LocationName(
      id: '3',
      locationName: 'Aswak Assalam Market',
      desc: 'CF46+HRR, Agadir 80000',
    ),
  ];

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

  @override
  void onInit() {
    super.onInit();
    getUserCurrentLocation();

    //
  }

  Future<void> loadIconImage() async {
    try {
      Uint8List bytes =
          await CommonCode().readBytesFromAsset("assets/icons/complet.png");
      if (bytes.isNotEmpty) {
        sourseLocationIcon =
            BitmapDescriptor.fromBytes(bytes, size:  Size.square(8),);
      }
    } on Exception catch (e) {
      log("~~~~~~~~~~~~~${e}");
      sourseLocationIcon = BitmapDescriptor.defaultMarker;
    }
    // BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
    //     'assets/icons/qwe.png')
    //     .then((d) {
    //   customIcon = d;
    // });
  }

  Future<Position> getCurrentPosition() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getUserCurrentLocation() async {
    await loadIconImage();
    getCurrentPosition().then((value) async {
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 13,
      );
      initialCameraPosition.value = cameraPosition;
      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      markers.add(
        Marker(
          markerId: const MarkerId("2"),
          zIndex: 12,
          position: LatLng(value.latitude, value.longitude),
          icon: sourseLocationIcon,
        ),
      );
      UserSession.latLng.value = LatLng(
        value.latitude,
        value.longitude,
      );
      currentAddress.value = await GeocodingService(dummy).coordinatesToAddress(
        value.latitude,
        value.longitude,
      );
      // currentAddress.refresh();
      notifyChildrens();
    });
  }

  void onSuggestionClick(Place placeDetails) {
    log('=============search ${placeDetails.name}');
    log('=============search ${placeDetails.streetNumber}');
  }
}



  // Future<void> handleSearch(BuildContext context) async {
  //   Prediction? p = await PlacesAutocomplete.show(
  //       context: context,
  //       apiKey: 'AIzaSyBgNdfyNQBkEFr4CyhYLe-TIwViksFdUGw',
  //       onError: onError,
  //       mode: Mode.overlay,
  //       language: 'en',
  //       strictbounds: false,
  //       types: [],
  //       decoration: InputDecoration(
  //           hintText: 'search',
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(20),
  //               borderSide: const BorderSide(color: Colors.white))),
  //       components: [Component(Component.country, "pk")]
  //   );
  //
  //   displayPrediction(p!,context);
  // }
  //
  // void onError(PlacesAutocompleteResponse response) {
  //   log('================= ${response.errorMessage}');
  //     Get.snackbar(
  //       'Message',
  //       response.errorMessage.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //
  // }
  //
  // Future<void> displayPrediction(
  //    Prediction p, BuildContext currentState) async {
  //   GoogleMapsPlaces _places = GoogleMapsPlaces(
  //       apiKey: 'AIzaSyBgNdfyNQBkEFr4CyhYLe-TIwViksFdUGw',
  //       apiHeaders: await const GoogleApiHeaders().getHeaders());
  //   PlacesDetailsResponse detail =
  //   await _places.getDetailsByPlaceId(p.placeId!);
  //   final lat = detail.result.geometry!.location.lat;
  //   final lng = detail.result.geometry!.location.lng;
  //   markers.clear();
  //   markers.add(Marker(markerId: const MarkerId('deliveryMarker'),
  //     position: LatLng(lat, lng),
  //     infoWindow: const InfoWindow(
  //       title: '',
  //     ),));
  //   }
  // }
