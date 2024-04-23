import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../models/ride_history_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/vertical_dotted_border.dart';

class RideHistoryCard extends StatelessWidget {
  final RideHistoryModel history;
  const RideHistoryCard({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(left: 12, top: 12, right: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  CupertinoIcons.time,
                  color: kGreyolor,
                ),
                const SizedBox(width: 12),
                Text(
                  history.time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: kGreyolor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/ic_current.png",
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      history.pick,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    CustomPaint(
                      painter: DashedLineVerticalPainter(),
                      child: const Divider(
                        height: 20,
                      ),
                    ),
                    // Expanded(
                    //   child: const Divider(
                    //     thickness: 0.5,
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/ic_pin.png",
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      history.drop,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  history.duration,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Wrap(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(
                            "--------------------->${history.status.toLowerCase()}");
                      },
                      child: Text(
                        history.status.toLowerCase() == "pending"
                            ? kConfirm
                            : history.status.toLowerCase() == "finished"
                                ? kFinished
                                : kCanceled,
                        style: TextStyle(
                          fontSize: 14,
                          color: history.status.toLowerCase() == "pending"
                              ? kAppGreenColor
                              : history.status.toLowerCase() == "finished"
                                  ? Colors.red
                                  : kGreyolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 22,
                      color: kGreyolor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
