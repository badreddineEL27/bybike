import 'package:bybike/controllers/invite_friends_screen_controller.dart';
import 'package:bybike/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class InviteFriendsScreen extends GetView<InviteFriendsScreenController> {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.1),
          child: Column(
            children: [
              const Text(
                kInviteFriends,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  wordSpacing: 0.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: TextField(
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    hintText: "Rechercher...",
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 24,
                      color: kGreyolor,
                    ),
                    fillColor: kWhiteColor,
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: double.maxFinite,
              height: Get.height,
              child: const Image(
                image: AssetImage(
                  "assets/images/background-transparent.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => Column(
                        children: [
                          const SizedBox(height: 12),
                          for (int index = 0;
                              index < controller.users.length;
                              index++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage("assets/images/elon.jpg"),
                                ),
                                title: Text(
                                  controller.users[index],
                                ),
                                trailing: index % 2 == 0
                                    ? Image.asset(
                                        "assets/icons/plus_circled.png",
                                        height: 42,
                                        width: 42,
                                      )
                                    : Image.asset(
                                        "assets/icons/tick_green_circle.png",
                                        height: 42,
                                        width: 42,
                                      ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
