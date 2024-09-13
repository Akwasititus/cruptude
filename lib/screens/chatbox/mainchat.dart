import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/utils.dart';
import 'chatbank.dart';

class MainChat extends StatefulWidget {
  const MainChat({Key? key}) : super(key: key);

  @override
  _MainChatState createState() => _MainChatState();
}

class _MainChatState extends State<MainChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  // SizedBox(
                  //   height: 100,
                  //   width: 100,
                  //   child: Stack(
                  //     clipBehavior: Clip.none,
                  //     fit: StackFit.expand,
                  //     children: [
                  //       Positioned(
                  //         right: -10,
                  //         bottom: 50,
                  //         child: IconButton(
                  //           icon: Icon(
                  //             Icons.verified_rounded,
                  //             color: Colors.indigo,
                  //           ),
                  //           onPressed: () {},
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),


                  // Badge(
                  //   position: BadgePosition.bottomEnd(),
                  //   badgeContent: Container(
                  //     width: 15,
                  //     height: 15,
                  //     alignment: Alignment.center,
                  //     child: const Text(''),
                  //   ),
                  //   badgeColor: Colors.green,
                  //   child: Image.asset(
                  //     'images/support.png',
                  //     height: 200,
                  //   ),
                  // ),
                  
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Support",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "4 active",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 70),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 5),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.bottomLeft
                            : Alignment.bottomRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                (messages[index].messageType == "receiver"
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )
                                    : const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      )),
                            color: (messages[index].messageType == "receiver"
                                ? AppColors.chatReceiver
                                : AppColors.primaryColorBlue),
                          ),
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            children: [
                              SelectableText(
                                messages[index].messageContent,
                                style: messages[index].messageType == "receiver"
                                    ? AllStyle.chatStyle1
                                    : AllStyle.chatStyle2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 5),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.bottomLeft
                            : Alignment.bottomRight),
                        child: Column(
                          children: [
                            Text(
                              messages[index].messageTime,
                              style: messages[index].messageType == "receiver"
                                  ? const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black)
                                  : const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        'images/send.png',
                        height: 100,
                        // width: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
