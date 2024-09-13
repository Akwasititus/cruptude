import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../constants/buttons.dart';
import '../../constants/utils.dart';

import 'notificationBank.dart';
import 'notification_body.dart';

class NotificationHeader extends StatefulWidget {
  @override
  State<NotificationHeader> createState() => _NotificationHeaderState();
}

class _NotificationHeaderState extends State<NotificationHeader> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
        child: Column(
          children: [
            Text('Notification', style: AllStyle.amountBig),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getNotificationModel.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    getNotificationModel[index]
                                        .notificationHeader,
                                    style: AllStyle.text2),
                                Text(
                                  DateFormat("yyyy-MM-dd kk:mm:ss")
                                      .format(DateTime.now()),
                                  textAlign: TextAlign.left,
                                  style: AllStyle.text3,
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: isSelected == index
                                  ? Colors.white
                                  : Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Container(
                  //padding: const EdgeInsets.all(15),
                  height: 33,
                  width: 120,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      Get.to(const NotificationBody());
                    },
                    child: const Text(
                      "View all",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ),
                Expanded(child: Container()),
                Container(
                  //padding: const EdgeInsets.all(15),
                  height: 33,
                  width: 110,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Center(
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Text("Clear all"))),
                ),
                //myButtons("faddy",AppColors.cardColor,)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
