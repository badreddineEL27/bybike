import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

extension TimeStampUtils on Timestamp {
  String get formatedTime {
    String statusTime = '';
    if (this != null) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
       if (DateTime.now().difference(date).inDays <= 0) {
        statusTime = "Today at ${date.hour}:${(date.minute).toString().padLeft(2, '0')}";
      } else if (DateTime.now().difference(date).inDays == 1) {
        statusTime = 'Yesterday at ${date.hour}:${(date.minute).toString().padLeft(2, '0')}';
      }
    }
    return statusTime;
  }
}

extension StringUtils on String {
  String get formatedTime {
    String lastDate = '';
    DateTime date =  isNotEmpty ? DateTime.parse(this) : DateTime.now();
    if (DateTime.now().difference(date).inDays <= 0) {
      lastDate = '${date.hour}:${(date.minute).toString().padLeft(2, '0')}';
    } else if (DateTime.now().difference(date).inDays == 1) {
      lastDate = 'Yesterday';
    } else {
      lastDate = DateFormat('MM/dd/yy').format(date);
    }
    return lastDate;
  }
}
