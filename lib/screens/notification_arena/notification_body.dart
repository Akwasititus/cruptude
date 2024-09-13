import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../constants/utils.dart';
import 'notificationBank.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  _NotificationBodyState createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  //padding: const EdgeInsets.all(15),
                  height: 33,
                  width: 130,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: const Center(child: Text("Mark all as read")),
                ),
                const SizedBox(
                  width: 25,
                ),
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
                  child: const Center(child: Text("Clear all")),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getNotificationModel.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              border:
                                  Border.all(width: 0.3, color: Colors.grey),
                            ),
                            child: const Icon(
                              Icons.flash_on_rounded,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
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
                                    textAlign: TextAlign.left,
                                    style: AllStyle.text2),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  DateFormat("yyyy-MM-dd kk:mm:ss")
                                      .format(DateTime.now()),
                                  style: AllStyle.text3,
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  getNotificationModel[index].notificationDesc,
                                  style: AllStyle.text3,
                                  textAlign: TextAlign.left,
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
                                  : Colors.green,
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
          ],
        ),
      ),
    );
  }
}
