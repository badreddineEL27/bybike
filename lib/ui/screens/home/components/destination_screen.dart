import 'package:bybike/controllers/destination_screen_controller.dart';
import 'package:bybike/ui/screens/home/home_screen.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../models/ride_possibilities_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/font_styles.dart';
import '../../../widgets/chat_text_bubble.dart';
import '../../../widgets/general_gradient_button.dart';

class DestinationScreen extends GetView<DestinationScreenController> {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Obx(
                () => GoogleMap(
                  mapType: MapType.normal,
                  markers: Set<Marker>.from(controller.markers),
                  // polylines: Set<Polyline>.from(controller.polyLines),
                  polylines: Set<Polyline>.from(controller.polyLines),
                  compassEnabled: true,
                  initialCameraPosition: controller.initialCameraPosition,
                  onMapCreated: (GoogleMapController mapcontroller) {
                    controller.mapController.complete(mapcontroller);
                  },
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              top: Get.height * 0.55,
              child: Obx(
                () => Visibility(
                  visible: controller.distance.isNotEmpty &&
                      controller.duration.isNotEmpty,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: const BorderSide(color: kBackgroundColor),
                          label: Text(controller.distance.value),
                        ),
                      ),
                      Obx(
                        () => Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: const BorderSide(color: kBackgroundColor),
                          label: Text(controller.duration.value),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(kAccountAndSettingsScreenRoute);
                },
                child: const CircleAvatar(
                  radius: 25,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/elon.jpg'),
                  ),
                ),
              ),
            ),
            possibilitiesBottomSheet()
          ],
        ),
      ),
    );
  }

  Widget possibilitiesBottomSheet() {
    return DraggableScrollableSheet(
      key: controller.possibilitiesSheetKey,
      initialChildSize: 0.44,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Possibilities: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: defaultFontFamily,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      height: constraints.maxHeight - 200, // Adjusted height
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.rideList.length,
                        itemBuilder: (BuildContext context, int index) {
                          RidePossibilitiesModel ride =
                              controller.rideList[index];
                          return possibilitiesCard(ride: ride);
                        },
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 10), // Adjusted margin
                    //   height: 30,
                    //   child: const Text(
                    //     'Possibilities: ',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, fontSize: 18),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(
                        top: constraints.maxHeight - 145,
                      ), // Adjusted margin
                      height: 110,
                      padding: const EdgeInsets.symmetric(horizontal: 12),

                      child: Column(
                        children: [
                          Divider(),
                          // const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset('assets/icons/w2.png', scale: 3),
                              const SizedBox(width: 10),
                              const Text(
                                kCashPayment,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const Icon(Icons.navigate_next_rounded),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => Get.dialog(const PromoCode()),
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Promo',
                                    style: TextStyle(
                                        color: kGreyolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          button(
                              text: 'Rèserver maintenant',
                              context: context,
                              controller: controller)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget possibilitiesCard({required RidePossibilitiesModel ride}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      height: 90,
      width: Get.width,
      decoration: BoxDecoration(
          color: const Color(0xffd2fae4),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              ride.ride,
              style: const TextStyle(
                fontSize: 15,
                color: kGreyolor,
                fontFamily: defaultFontFamily,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, left: 10),
            child: Row(
              children: [
                ride.gender == 'Conductrice'
                    ? Image.asset(
                        'assets/icons/venus.png',
                        scale: 3,
                      )
                    : Image.asset(
                        'assets/icons/sfv.png',
                        scale: 3,
                      ),
                const SizedBox(width: 8),
                Text(
                  ride.gender,
                  style: const TextStyle(fontSize: 13, color: kGreyolor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 12),
            child: Row(
              children: [
                Text(
                  ride.price,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: defaultFontFamily,
                      color: kAppIconBlueColor),
                ),
                const SizedBox(
                  width: 30,
                ),
                Image.asset(
                  'assets/icons/uj.png',
                  scale: 3.2,
                  color: Colors.black45,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  ride.time,
                  style: const TextStyle(
                      fontSize: 12,
                      color: kGreyolor,
                      fontFamily: defaultFontFamily),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: ride.gender == 'Conductrice'
                ? Image.asset(
                    'assets/images/scooter.png',
                    scale: 4,
                  )
                : Image.asset(
                    'assets/images/bike.png',
                    scale: 4,
                  ),
          )
        ],
      ),
    );
  }
}

class ReservationDialog extends StatelessWidget {
  final DestinationScreenController controller;
  const ReservationDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kWhiteColor,
      contentPadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/bike1.png",
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Réservation Réussie",
              style: TextStyle(
                fontSize: 17,
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Votre réservation a été confirmée.\nLe conducteur viendra vous chercher",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  height: 0.8,
                  color: Colors.black54,
                  fontFamily: descFontFamily),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.toNamed(kAddRatingScreenRoute);
                    },
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                          color: kGreyolor,
                          fontSize: 15,
                          fontFamily: labelFontFamily),
                    )),
                const VerticalDivider(width: 1),
                GestureDetector(
                  onTap: () async {
                    Get.back();
                    bool result = await Get.toNamed(kPaymentScreenRoute);
                    if (result != null && result == true) {
                      controller.ridePlaced.value = true;
                    } else {
                      controller.ridePlaced.value = false;
                    }
                  },
                  child: const Text(
                    'Terminé',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: labelFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget button(
    {required String text, context, DestinationScreenController? controller}) {
  return GestureDetector(
    onTap: () {
      if (controller != null) {
        showSheet(context, controller);
      } else {
        Get.back();
      }
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 45,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [kBackgroundColor, kAppGreenColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: kAppGreenColor.withOpacity(0.5),
            // spreadRadius: 5,
            // blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: kWhiteColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            fontFamily: buttonFontFamily,
          ),
        ),
      ),
    ),
  );
}

class PromoCode extends StatelessWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kAppGreenColor,
      insetPadding: const EdgeInsets.all(0),
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 280,
        width: Get.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade900.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
            color: kWhiteColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Stack(
                children: [
                  const Center(
                      child: Text(
                    'Promo Code',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close),
                        color: kAppGreenColor,
                      )),
                ],
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Image.asset(
                        'assets/icons/promo.png',
                        scale: 5,
                      ),
                      hintText: 'Promo Code',
                      hintStyle: TextStyle(color: Colors.grey.shade400)),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: button(text: 'Rèserver maintenant'),
            )
          ],
        ),
      ),
    );
  }
}

void showSheet(BuildContext context, DestinationScreenController controller) {
  showModalBottomSheet(
    constraints: BoxConstraints(
      maxHeight: Get.height * 0.44,
      minHeight: Get.height * 0.24,
    ),
    context: context,
    builder: (context) {
      return Column(
        children: [
          SizedBox(
            height: 40,
            width: Get.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      CupertinoIcons.multiply,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              // tileColor: Colors.blueGrey.shade50,
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/elon.jpg'),
              ),
              title: const Text(
                "Mohamed",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Wrap(
                children: [
                  RatingBar.builder(
                    initialRating: 4,
                    itemSize: 16,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const Text(
                    " 4/5",
                    style: TextStyle(
                      color: kGreyolor,
                    ),
                  )
                ],
              ),
              trailing: const Text(
                "Harley-Davidson CH",
                style: TextStyle(fontSize: 10),
              )),
          const Divider(
            thickness: 0.5,
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            leading: Stack(
              children: [
                Image.asset(
                  "assets/images/profiles3.png",
                  height: 30,
                )
              ],
            ),
            title: const Text(
              "12 Recommendations",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kGreyolor,
                fontFamily: defaultFontFamily,
              ),
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/bike1.png",
                  height: 60,
                  width: 60,
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DISTANCE",
                            style: TextStyle(
                              fontFamily: labelFontFamily,
                              color: Colors.black38,
                            ),
                          ),
                          Text(
                            "0.2 km",
                            style: TextStyle(
                              fontFamily: defaultFontFamily,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TEMPS",
                              style: TextStyle(
                                  fontFamily: defaultFontFamily,
                                  color: Colors.black38)),
                          Text(
                            "0.2 km",
                            style: TextStyle(
                              fontFamily: defaultFontFamily,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PRIX",
                            style: TextStyle(
                                fontFamily: defaultFontFamily,
                                color: Colors.black38),
                          ),
                          Text(
                            "0.2 km",
                            style: TextStyle(
                              fontFamily: defaultFontFamily,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            width: Get.width,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showChatDialog(context);
                  },
                  child: Image.asset(
                    "assets/icons/chat.png",
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Obx(
                    () => GradientButton(
                      onTap: () {
                        if (controller.ridePlaced.value) {
                          controller.ridePlaced.value = false;
                          Get.back();
                          Get.toNamed(kAddRatingScreenRoute);
                        } else {
                          Get.dialog(ReservationDialog(
                            controller: controller,
                          ));
                        }
                      },
                      gradientColors: controller.ridePlaced.value
                          ? [
                              Colors.red,
                              Colors.red.shade700,
                            ]
                          : const [
                              buttonColor1,
                              Colors.green,
                            ],
                      buttonText: controller.ridePlaced.value
                          ? "Annuler la réservation"
                          : confrim,
                      textColor: kWhiteColor,
                      fontFamily: buttonFontFamily,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  radius: 20,
                  child: const Icon(
                    Icons.call,
                    color: kWhiteColor,
                  ),
                )
              ],
            ),
          )
        ],
      );
    },
  );
}

Future<dynamic> showChatDialog(BuildContext context) {
  TextEditingController chatController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.tight(
            Size.fromHeight(Get.height * 0.7),
          ),
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: Get.height * 0.16,
            bottom: MediaQuery.of(context).viewInsets.bottom + Get.height * 0.1,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/elon.jpg'),
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mohamed",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: defaultFontFamily,
                              ),
                            ),
                            Text(
                              "En ligne",
                              style: TextStyle(
                                color: kGreyolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: kWhiteColor,
                          shape: const CircleBorder(),
                        ),
                        icon: const Icon(
                          CupertinoIcons.multiply,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                ),
                SizedBox(
                  height: Get.height * 0.46,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        return ChatTextSimpleBubble(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          constraints:
                              BoxConstraints(maxWidth: Get.width * 0.6),
                          color: Colors.green,
                          textStyle: const TextStyle(
                              color: kWhiteColor,
                              fontFamily: labelFontFamily,
                              fontSize: 12),
                          text:
                              "Bonjour Mohamed. Je suis en CH pressé. Accepteriez-vous de commencer notre trajet maintenant?",
                        );
                      } else {
                        return ChatTextSimpleBubble(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          constraints:
                              BoxConstraints(maxWidth: Get.width * 0.6),
                          color: Colors.grey.shade200,
                          isSender: false,
                          text:
                              "Bonjour Mohamed. Je suis en CH pressé. Accepteriez-vous de commencer notre trajet maintenant?",
                          textStyle: const TextStyle(
                              color: Colors.black87,
                              fontFamily: labelFontFamily,
                              fontSize: 12),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: chatController,
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: "Entrer un message...",
                            hintStyle: TextStyle(
                                fontFamily: labelFontFamily, fontSize: 14),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/qwe.png",
                          height: 40,
                          width: 40,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
