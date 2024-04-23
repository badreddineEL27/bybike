
import 'dart:convert';
import 'dart:developer';

import 'package:bybike/utils/serve.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/place_model.dart';
import '../models/prediction_model.dart';

class PlacesService {

  PlacesService._internal();

  factory PlacesService() {
    return _instance;
  }
  static final PlacesService _instance = PlacesService._internal();

  String sessionToken = "12345";


  Future<List> getSuggest(String input) async {
    String baseUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request = "$baseUrl?input=$input&key=$dummy&sessiontoken=$sessionToken";

    var response = await http.get(Uri.parse(request));

    log("----------------->${response.body}");
    var data = response.body.toString();

    if (response.statusCode == 200) {
      return jsonDecode(data)['predictions']??[];
    } else {
      throw Exception("Failed to load data");
    }
  }

  String kPlaceURL = "https://maps.googleapis.com/maps/api/place/details/json?";
  String kBaseURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json?";

  Future<List<PredictionModel>> getAutoComplete(String input) async {
    List<PredictionModel> predictions = [];
    final String request = '$kBaseURL?input=$input&key=$dummy';
    final response = await http.get(Uri.parse(request), headers: {'Content-Type': 'application/json'});
    final json = convert.jsonDecode(response.body);
    if (json['status'] == 'OK') {
      for (var prediction in json['predictions']??[]) {
        predictions.add(PredictionModel.fromJson(prediction));
      }
    }
    return predictions;
  }

  Future<PlaceModel> getPlace(String placeId) async {
    PlaceModel place = PlaceModel.empty();
    final String url = '$kPlaceURL?place_id=$placeId&key=$dummy';
    final response = await http.get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    var json = convert.jsonDecode(response.body);
    if (json['status'] == 'OK') {
      place = PlaceModel.fromJson(json['result']);
    }
    return place;
  }

  // Future<List<PlaceModel>> getAllBusinessLocation() async {
  //   List<PlaceModel> places = [];
  //   List<PopularLocationModel> popularLocationList = [];
  //   QuerySnapshot querySnapshot = await FirebaseCollections.popularLocationsCollection.get();
  //    for (var doc in querySnapshot.docs) {
  //     popularLocationList.add(PopularLocationModel.fromJson(doc.data() as Map<String, dynamic>));
  //   }
  //   for (var country in popularLocationList) {
  //     QuerySnapshot querySnapshot = await FirebaseCollections.popularLocationsCollection.doc(country.name).collection("Businesses").get();
  //     for (var doc in querySnapshot.docs) {
  //       var data = doc.data() as Map<String, dynamic>;
  //       places.add(PlaceModel.fromJson(data['result']));
  //     }
  //   }
  //   return places;
  // }

  
}