
import 'location_model.dart';

class PlaceModel {
  String name = '';
  String address = '';
  GeometryModel geometry = GeometryModel.empty();

  PlaceModel.empty();

  PlaceModel({
    required this.name,
    required this.address,
    required this.geometry,
  });

  PlaceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    address = json['formatted_address'] ?? '';
    geometry = GeometryModel.fromJson(json['geometry'] ?? <String, dynamic>{});
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['formatted_address'] = address;
    data['geometry'] = geometry.toJson();
    return data;
  }
}
