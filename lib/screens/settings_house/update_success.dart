import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/utils.dart';
import '../landing_page/dash_bord.dart';
import '../landing_page/home_screen.dart';

class UpdateSuccess extends StatefulWidget {
  UpdateSuccess({Key? key}) : super(key: key);

  @override
  State<UpdateSuccess> createState() => _UpdateSuccessState();
}

class _UpdateSuccessState extends State<UpdateSuccess> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 10,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Change Password',
                        style: AllStyle.text15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text('New Password', style: AllStyle.amountBig),
                  Text('Your new password has been set', style: AllStyle.text2),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(HomeScreen());
                },
                child: Container(
                  //padding: const EdgeInsets.all(15),
                  height: 33,
                  width: 110,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: const Center(child: Text("Get home")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
