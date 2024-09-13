import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/Controller.dart';
import '../../constants/utils.dart';
import '../introduction_screens/introduction_screen_banks/onbording_bank.dart';
import '../notification_arena/notification_header.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'dashBord/sell_GiftCard_list.dart';
import 'dashBord/sell_cryptude_list.dart';

class DashBord extends StatefulWidget {
  //const DashBord({ required this.info});
  const DashBord({
    Key? key,
  }) : super(key: key);

  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  // late String name, email, phone;
  final _controller = PageController(initialPage: 0);
  var currentName = 'Sell Crptude';

  // final List<String> titles = [
  //   ' Coffee ',
  //   ' Bread ',
  //   ' Gelato ',
  //   ' Ice Cream ',
  //   ' Ice pop ',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            child: Image.asset(
              'images/supportnew.png',
              height: 100, color: Colors.black38,
              // width: 50,
            ),
            onTap: () {
              Get.toNamed('/mainChat');
            },
          ),
          GestureDetector(
            child: Image.asset('images/notificationnew.png',
                height: 100, color: Colors.black38
                // width: 50,
                ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return NotificationHeader();
                  });
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
                itemCount: getIntroductionContent.length,
                itemBuilder:
                    (context, introductionContentIndex, pageViewIndex) =>
                        SizedBox(
                          height: 150,
                          child: Image.asset(
                            getIntroductionContent[introductionContentIndex]
                                .introduction_contentUrl,
                          ),
                        ),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentName = "Sell Cryptude";
                    });
                    _controller.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  currentName,
                  style: AllStyle.text15,
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentName = "Sell Gift Card";
                    });
                    _controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                children: const [
                  SellCrytude(),
                  //<<<<Sell Gift  Card>>>>>
                  SellGiftCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
