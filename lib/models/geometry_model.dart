class LocationModel{
  double lat = 0.0;
  double lng = 0.0;

  LocationModel.empty();
  
  LocationModel({
    required this.lat,
    required this.lng
  });

  LocationModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] ?? 0.0;
    lng = json['lng'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }

}