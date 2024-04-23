import 'package:bybike/controllers/serached_location_screen_controller.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/common_code.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:bybike/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../utils/constants.dart';

class SearchedLocationScreen extends GetView<SearchedLocationScreenController> {
  const SearchedLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: Get.height * 0.08),
            height: Get.height,
            width: Get.width,
            child: Obx(
              () => GoogleMap(
                mapType: MapType.normal,
                compassEnabled: true,
                markers: Set<Marker>.of(controller.markers),
                initialCameraPosition: controller.initialCameraPosition,
                onMapCreated: (GoogleMapController locationController) {
                  controller.mapController.complete(locationController);
                },
              ),
            ),
          ),
          Obx(
            () => Container(
              height: controller.placesList.isEmpty ? 50 : Get.height * 0.24,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 60),
              decoration: BoxDecoration(
                color: kWhiteColor, // Background color with shade
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: controller.searchAddressController,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: defaultFontFamily,
                      ),
                      onChanged: (value) async {
                        if (!(await CommonCode().checkInternetConnection())) {
                          CommonCode().showToast(
                              message: "Please Check Your Internet Connection");
                        } else {
                          print('========onchange');
                          controller.onSearchChanged(value);
                        }
                      },
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () {
                        controller.placesList.value = [];
                      },
                      decoration: InputDecoration(
                        hintText: universiapolisAgadir,
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: defaultFontFamily),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 15),
                        prefixIcon: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: kGreyolor,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.searchAddressController.clear();
                            controller.placesList.value = [];
                          },
                          child: const Icon(
                            Icons.cancel,
                            color: kGreyolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: controller.placesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.onSearchedPlaceTap(
                                controller.placesList[index].description);
                          },
                          // minVerticalPadding: 2,
                          // contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                color: kBackgroundColor,
                              ),
                            )),
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: buttonColor1,
                                ),
                                const SizedBox(width: 16),
                                Flexible(
                                  child: Text(
                                    controller.placesList[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: defaultFontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: GestureDetector(
        onTap: () async {
          if (!(await CommonCode().checkInternetConnection())) {
            CommonCode()
                .showToast(message: "Please Check Your Internet Connection");
          } else if (controller.searchAddressController.text.isNotEmpty) {
            controller
                .onSearchedPlaceTap(controller.searchAddressController.text)
                .then(
              (value) {
                if (UserSession.latLng.value != null) {
                  Get.toNamed(
                    kDestinationScreenRoute,
                    arguments: {
                      "source": controller.sourceAddress,
                      "destination": controller.searchAddressController.text,
                      'sourceLoc': UserSession.latLng.value,
                      'destinationLoc': controller.destinationLatLng.value,
                    },
                  );
                } else {
                  CommonCode().showToast(message: "Unable to find the source location");
                }
              },
            );
          }
        },
        child: Container(
          height: 70,
          width: Get.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kBackgroundColor, kAppGreenColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: const Center(
            child: Text(
              'APPLY',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
