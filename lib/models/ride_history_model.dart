class RideHistoryModel {
  final String id;
  final String time;
  final String pick;
  final String drop;
  final String duration;
  final String status;

  RideHistoryModel({
    required this.id,
    required this.time,
    required this.pick,
    required this.drop,
    required this.duration,
    required this.status,
  });
}
