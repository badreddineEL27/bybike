import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteFriendsScreenController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<String> users = [
    "Rechercher",
    "Scorpion",
    "Subzero",
    "Liu Kang",
    "Shang Tsung",
    "Baraka",
    "Noob Saibot",
    "Drahmin",
    "Liu Kang",
    "Shang Tsung",
    "Baraka",
    "Noob Saibot",
    "Drahmin"
  ].obs;
}
