import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class GeocodingService {
  final String apiKey; // Your Google Maps API key

  GeocodingService(this.apiKey);

  Future<Map<String, double>> addressToCoordinates(String address) async {
    // String formattedAddress = Uri.encodeComponent(address);
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      final body = json.decode(response.body);
      log("---------------> ${body}");
      if (body['status'] == 'OK') {
        final results = body['results'][0]??{};
        final location = results['geometry']['location']??{};

        double lat = location['lat'];
        double lng = location['lng'];

        return {'lat': lat, 'lng': lng};
      } else {
        throw Exception('Failed to fetch coordinates');
      }
    } catch (e) {
      throw Exception('Failed to fetch coordinates: $e');
    }
  }

  Future<String> coordinatesToAddress(double latitude, double longitude) async {
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      final body = json.decode(response.body);
      log("---------------> ${body}");

      if (body['status'] == 'OK') {
        final results = body['results'][0]??{};
        final formattedAddress = results['formatted_address']??"";

        return formattedAddress;
      } else {
        throw Exception('Failed to fetch address');
      }
    } on Exception catch (e) {
      throw Exception('Failed to fetch address: $e');
    }
  }
}
