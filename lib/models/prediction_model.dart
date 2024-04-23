class PredictionModel {
  String placeId = '';
  String description = '';

  PredictionModel.empty();

  PredictionModel({
    required this.placeId,
    required this.description,
  });

  PredictionModel.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'] ?? '';
    description = json['description'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['place_id'] = placeId;
    data['description'] = description;
    return data;
  }
  
}