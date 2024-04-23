// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybike/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreenController extends GetxController{

  RxInt currentIndex = RxInt(0);

  List<CarouselItem> items = [
    CarouselItem(
      title: easyBooking, 
      desc: "", 
      imageUrl: "assets/images/page_first.png",
    ),
    CarouselItem(
      title: checkYourRoute, 
      desc: "", 
      imageUrl: "assets/images/page_second.png",
    ),
    CarouselItem(
      title: quickResponses, 
      desc: "", 
      imageUrl: "assets/images/page_third.png",
    ),
  ];


  

  onIndexChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
    notifyChildrens();
  }
}

class CarouselItem {
  final String title;
  final String desc;
  final String imageUrl;
  CarouselItem({
    required this.title,
    required this.desc,
    required this.imageUrl,
  });
}
