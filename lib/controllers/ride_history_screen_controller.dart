import 'package:bybike/models/ride_history_model.dart';
import 'package:bybike/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideHistoryScreenController extends GetxController {

  RxList<RideHistoryModel> rideHistory = [
    RideHistoryModel(
      id: '1', 
      time: "Today, 12h30", 
      pick: location1, 
      drop: location2, 
      duration: "12:00 Dh", 
      status: "pending"
    ),
    RideHistoryModel(
      id: '2', 
      time: "Today, 12h30", 
      pick: location1, 
      drop: location2, 
      duration: "12:00 Dh", 
      status: "finished"
    ),
    RideHistoryModel(
      id: '3', 
      time: "Today, 12h30", 
      pick: location1, 
      drop: location2, 
      duration: "8:00 Dh", 
      status: "cancelled"
    ),

    RideHistoryModel(
      id: '3', 
      time: "Today, 12h30", 
      pick: location1, 
      drop: location2, 
      duration: "8:00 Dh", 
      status: "cancelled"
    ),
    RideHistoryModel(
      id: '3', 
      time: "Today, 12h30", 
      pick: location1, 
      drop: location2, 
      duration: "8:00 Dh", 
      status: "cancelled"
    ),
    RideHistoryModel(
      id: '3', 
      time: "Today, 12h30", 
      pick: location1, 
      drop: location2, 
      duration: "8:00 Dh", 
      status: "cancelled"
    ),
  ].obs;
  
}