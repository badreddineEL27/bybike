import 'package:bybike/ui/widgets/general_gradient_button.dart';
import 'package:bybike/utils/app_colors.dart';
import 'package:bybike/utils/constants.dart';
import 'package:bybike/utils/font_styles.dart';
import 'package:bybike/utils/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../controllers/add_rating_screen_controller.dart';

class AddRatingScreen extends GetView<AddRatingScreenController> {
  const AddRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4, top: 16),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/background-transparent.png",
                ),
                fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            padding:
                EdgeInsets.only(bottom: Get.height * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  assesment,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  margin: const EdgeInsets.all(12),
                  alignment: Alignment.topCenter,
                  height: Get.height * 0.8,
                  width: Get.width * 0.9,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40,
                        child: Container(
                          padding: const EdgeInsets.only(top: 44),
                          width: Get.width * 0.88,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Mohamed",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: 4,
                                itemSize: 24,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Harley-Davidson CH",
                                style:
                                    TextStyle(fontSize: 18, color: kGreyolor),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                child: Text(
                                  howIsYourJourneyGoing,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                    letterSpacing: 0.01,
                                    wordSpacing: 0.01,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Text(
                                "Votre retour d'expérience\ncontribuera à améliorer\nl'expérience de conduite",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: kGreyolor, fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: "Commentaires...",
                                  hintStyle: const TextStyle(fontSize: 13),
                                    fillColor: Colors.grey.shade100,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    filled: true,
                                    constraints: BoxConstraints(
                                        maxWidth: Get.width * 0.78)),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: Get.width * 0.7,
                                child: GradientButton(
                                  onTap: () {
                                    Get.offAndToNamed(kHomeScreenRoute);
                                  },
                                  gradientColors: [
                                    Colors.green.shade300,
                                    Colors.green
                                  ],
                                  buttonText: submitReview,
                                  textColor: kWhiteColor,
                                  fontFamily: buttonFontFamily,
                                  borderRadius: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/elon.jpg",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
