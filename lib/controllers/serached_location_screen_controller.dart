import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:bybike/helpers/map_helper.dart';
import 'package:bybike/models/prediction_model.dart';
import 'package:bybike/services/geocoding_service.dart';
import 'package:bybike/services/places_services.dart';
import 'package:bybike/utils/common_code.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:bybike/utils/serve.dart';
import 'package:bybike/utils/user_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_search_place/model/prediction.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class SearchedLocationScreenController extends GetxController {
  RxList<PredictionModel> placesList = RxList([]);

  final RxString _sessionToken = RxString('');

  TextEditingController searchAddressController = TextEditingController();

  Completer<GoogleMapController> mapController = Completer();

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(34.0084, -6.8539),
    zoom: 10.0,
  );

  String sourceAddress = "";

  Rx<LatLng?> destinationLatLng = Rx(null);

  // Rx<LatLng>? sourseLocation;
  // Rx<LatLng>? destinationLocation;

  BitmapDescriptor destinationLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor sourseLocIcon = BitmapDescriptor.defaultMarker;
  RxList<Marker> markers = <Marker>[].obs;

  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments ?? {};
    searchAddressController.text = args['destination'] ?? "";
    sourceAddress = args['source'] ?? "";
    addMarkerAndAnimateCamera();
    searchAddressController.addListener(() {
      onSearchChanged(searchAddressController.text);
    });
  }

  Future<void> loadIconImage() async {
    try {
      Uint8List bytes =
          await CommonCode().readBytesFromAsset("assets/icons/complet.png");
      if (bytes.isNotEmpty) {
        sourseLocIcon =
            BitmapDescriptor.fromBytes(bytes, size: const Size.square(8));
      }
      Uint8List dBytes =
          await CommonCode().readBytesFromAsset("assets/icons/blue_marker.png");
      if (dBytes.isNotEmpty) {
        destinationLocationIcon =
            BitmapDescriptor.fromBytes(dBytes, size: Size(8, 8));
      }
    } on Exception catch (e) {
      log("~~~~~~~~~~~~~${e}");
      destinationLocationIcon = BitmapDescriptor.defaultMarker;
    }
  }

  // Future<void> loadIconImage() async {
  //   BitmapDescriptor.fromAssetImage(
  //           const ImageConfiguration(size: Size(12, 12)), 'assets/icons/as.png')
  //       .then((d) {
  //     customIcon = d;
  //   });
  // }

  void addMarkerAndAnimateCamera() async {
    await loadIconImage();
    CameraPosition cameraPosition = CameraPosition(
      target: UserSession.latLng.value!,
      zoom: 14,
    );
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: UserSession.latLng.value!,
        icon: sourseLocIcon,
      ),
    );
    markers.refresh();
  }

  void onSuggestionClick() {
    //
  }

  onSearchChanged(String value) async {
    Uuid uuid = const Uuid();
    if (_sessionToken.value.isEmpty) {
      _sessionToken.value = uuid.v4();
    }
    getSuggestion(value);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = dummy;
    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      List values = jsonDecode(response.body)['predictions'] ?? [];
      placesList.clear();
      for (var val in values) {
        placesList.add(PredictionModel.fromJson(val));
      }
      placesList.refresh();
      notifyChildrens();
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  // Future<void> _handlePressButton() async {
  //   // show input autocomplete with selected mode
  //   // then get the Prediction selected
  //   Prediction p = await PlacesAutocomplete.show(
  //     context: context,
  //     apiKey: kGoogleApiKey,
  //     onError: onError,
  //     mode: _mode,
  //     language: "fr",
  //     decoration: InputDecoration(
  //       hintText: 'Search',
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         borderSide: BorderSide(
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //     components: [Component(Component.country, "fr")],
  //   );

  //   displayPrediction(p, homeScaffoldKey.currentState);
  // }

  // Future<void> getSuggestion(pattern) async {
  //   placesList = await PlacesService().getAutoComplete(pattern);
  // }

  Future<void> onSearchedPlaceTap(String address) async {
    if (address.isEmpty) return;
    searchAddressController.text = address;
    placesList.value = [];
    placesList.refresh();

    Map<String, double> latLngMap =
        await GeocodingService(dummy).addressToCoordinates(address);
    if (latLngMap.isNotEmpty &&
        latLngMap['lat'] != null &&
        latLngMap['lng'] != null) {
      destinationLatLng.value = LatLng(latLngMap['lat']!, latLngMap['lng']!);
      CameraPosition cameraPosition = CameraPosition(
        target: destinationLatLng.value!,
        zoom: 14,
      );

      await loadIconImage();

      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      markers.add(Marker(
        markerId: const MarkerId("9"),
        position: UserSession.latLng.value!,
        icon: sourseLocIcon,
      ));
      markers.add(
        Marker(
          markerId: const MarkerId("10"),
          position: destinationLatLng.value!,
          icon: destinationLocationIcon,
        ),
      );
      markers.refresh();
    }

    log("----------------${UserSession.latLng.value}");
    notifyChildrens();
  }
}
