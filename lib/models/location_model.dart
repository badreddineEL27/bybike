
import 'geometry_model.dart';

class GeometryModel {
  LocationModel location = LocationModel.empty();

  GeometryModel.empty();

  GeometryModel({
    required this.location,
  });
  

  GeometryModel.fromJson(Map<String, dynamic> json) {
    location = LocationModel.fromJson(json['location'] ?? <String, dynamic>{});
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location.toJson();
    return data;
  }

}