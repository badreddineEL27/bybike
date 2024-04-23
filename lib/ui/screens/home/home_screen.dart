import 'package:bybike/controllers/home_screen_controller.dart';
import 'package:bybike/models/location_names_model.dart';
import 'package:bybike/ui/widgets/chat_text_bubble.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:bybike/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../utils/font_styles.dart';
import '../../widgets/general_gradient_button.dart';
import '../../widgets/vertical_dotted_border.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

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
                  markers: Set<Marker>.of(controller.markers),
                  compassEnabled: true,
                  initialCameraPosition: controller.initialCameraPosition.value,
                  onMapCreated: (GoogleMapController mapcontroller) {
                    controller.mapController.complete(mapcontroller);
                  },
                ),
              ),
            ),
            // AddressAutocompleteTextField(
            //     mapsApiKey: 'AIzaSyBgNdfyNQBkEFr4CyhYLe-TIwViksFdUGw',
            //     onSuggestionClick: controller.onSuggestionClick,
            //     componentCountry: 'pk',
            //     language: 'en-US'
            // ),
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(kAccountAndSettingsScreenRoute);
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/elon.jpg'),
                ),
              ),
            ),
            searchPlaceBottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget searchPlaceBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.28,
      minChildSize: 0.28,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          height: Get.height / 1.15,
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
            physics: const ClampingScrollPhysics(),
            controller: scrollController,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                          color: kGreyolor,
                          borderRadius: BorderRadius.circular(5)),
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 60.0, top: 28),
                  child: Text(
                    'Lieu de depart',
                    style: TextStyle(color: kGreyolor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 20),
                  child: Image.asset(
                    "assets/icons/ic_current.png",
                    height: 24,
                    width: 24,
                  ),
                ),
                Obx(
                  () => Container(
                    margin: const EdgeInsets.only(top: 52, left: 60),
                    child: Text(
                      controller.currentAddress.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: defaultFontFamily,
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 72, left: 20),
                    child: const Divider(endIndent: 50, indent: 40)),
                Container(
                  margin: const EdgeInsets.only(top: 70, left: 32),
                  child: CustomPaint(
                    painter: DashedLineVerticalPainter(),
                    child: const SizedBox(
                      height: 45,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 60.0, top: 94),
                  child: Text(
                    'Destination',
                    style: TextStyle(color: kGreyolor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 118, left: 20),
                  child: Image.asset(
                    "assets/icons/ic_pin.png",
                    height: 24,
                    width: 24,
                  ),
                ),
                Obx(
                  () => Container(
                    margin: const EdgeInsets.only(top: 105, left: 45),
                    child: TextField(
                      controller: controller.searchController,
                      onTap: () {
                        // controller.handleSearch(context);
                        controller.isHovered.value = true;
                      },
                      onTapOutside: (value) {
                        controller.isHovered.value = false;
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(
                            Icons.search,
                            color: kGreyolor,
                            size: 28,
                          ),
                        ),
                        suffixIcon: controller.isHovered.value
                            ? SizedBox(
                                width: 110,
                                height: 10,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.searchController.clear();
                                      },
                                      icon: const Icon(Icons.cancel),
                                      color: Colors.red,
                                    ),
                                    const VerticalDivider(
                                      indent: 12,
                                      endIndent: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        String text =
                                            controller.searchController.text;
                                        if (text.isNotEmpty) {
                                          Get.toNamed(
                                            kSearchedLocationScreenRoute,
                                            arguments: {
                                              "destination": controller
                                                  .searchController.text,
                                            },
                                          );
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/icons/ic_map.png',
                                        scale: 4.5,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        border: InputBorder.none,
                        hintText: 'Universiapolis Agadir',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: defaultFontFamily,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 160, left: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 38,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue.shade100,
                          ),
                          child: const Center(
                            child: Text('Parkids Agadir'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 38,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue.shade100,
                          ),
                          child: const Center(
                            child: Text('Cafe Cocoperia'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 38,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue.shade100,
                          ),
                          child: const Center(
                            child: Text('Aswak Assalam Market'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 220,
                    ),
                    child: Divider(
                      thickness: 8,
                      color: Colors.grey.shade300,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 250, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'LEIUX POPULAIRES',
                          style: TextStyle(
                            color: kGreyolor,
                            fontFamily: defaultFontFamily,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.dummyLocationNames.length,
                          itemBuilder: (BuildContext context, int index) {
                            LocationName location =
                                controller.dummyLocationNames[index];
                            return GestureDetector(
                              onTap: () => Get.toNamed(
                                kSearchedLocationScreenRoute,
                              ),
                              child: ListTile(
                                minLeadingWidth: 20,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 0,
                                ),
                                leading: const Icon(
                                  Icons.location_on_outlined,
                                  color: kAppGreenColor,
                                  size: 28,
                                ),
                                title: Text(
                                  location.locationName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: defaultFontFamily,
                                  ),
                                ),
                                subtitle: Text(
                                  location.desc,
                                  style: const TextStyle(
                                    color: kGreyolor,
                                    fontFamily: buttonFontFamily,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, __) => Divider(
                            indent: Get.width * 0.16,
                            height: 2,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
