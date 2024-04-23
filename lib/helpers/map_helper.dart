import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
class MapHelper {


  List<LatLng> getCordinatesLst(double latitude, double longitude, double totalLength, double targetDistance) {
    List coordinates = generateCoordinates(latitude, longitude, totalLength, targetDistance);
    List<LatLng> lst = [];
     for (int i = 0; i < coordinates.length; i++) {
      lst.add(LatLng(coordinates[i][0], coordinates[i][1]));
    }
    return lst;
  }
  // Function to convert degrees to radians
  double degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

// Function to convert radians to degrees
  double radiansToDegrees(double radians) {
    return radians * 180.0 / pi;
  }

// Function to generate 10 coordinates approximately 1 km apart in a circular pattern
  List<List<double>> generateCoordinates(double startLat, double startLon, double totalLength, double targetDistance) {
    List<List<double>> coordinates = [];
    const double earthRadius = 6371.0; // Earth radius in kilometers

    // Generate 10 random angles between 0 and 360 degrees
    List<double> angles =
        List.generate(totalLength.toInt(), (_) => Random().nextDouble() * 360.0);

    // Calculate coordinates based on angles
    for (var angle in angles) {
      // Calculate the new latitude and longitude based on the current angle
      double lat = asin(
          sin(degreesToRadians(startLat)) * cos(targetDistance / earthRadius) +
              cos(degreesToRadians(startLat)) *
                  sin(targetDistance / earthRadius) *
                  cos(degreesToRadians(angle)));
      double lon = degreesToRadians(startLon) +
          atan2(
              sin(degreesToRadians(angle)) *
                  sin(targetDistance / earthRadius) *
                  cos(degreesToRadians(startLat)),
              cos(targetDistance / earthRadius) -
                  sin(degreesToRadians(startLat)) * sin(lat));

      // Convert radians to degrees
      lat = radiansToDegrees(lat);
      lon = radiansToDegrees(lon);

      // Add the new coordinate to the list
      coordinates.add([lat, lon]);
    }

    return coordinates;
  }
}
