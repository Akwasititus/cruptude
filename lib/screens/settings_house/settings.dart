import 'dart:io';

import 'package:cryptude/screens/settings_house/terms_and_condition.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/utils.dart';
import '../introduction_screens/onbording_screen.dart';

import 'change_password.dart';
import 'faq.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // File? _image;
  // final _picker = ImagePicker();
  // // Implementing the image picker
  // Future<void> _openImagePicker() async {
  //   final XFile? pickedImage =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AllStyle.text2,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            size: 10,
            color: Colors.black,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.09),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        )),
                    // child: Image.asset(
                    //   'images/profile1.png',
                    //   height: 100,
                    // ),
                    child:
                        // _image != null
                        //     ? Image.file(_image!, fit: BoxFit.cover)
                        //     :
                        Image.asset(
                      'images/profile1.png',
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    //_openImagePicker,
                    child: GestureDetector(
                      //onTap: _openImagePicker,
                      child: Text(
                        'Change Avatar',
                        style: AllStyle.avatarColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("JOHN23", style: AllStyle.amountBig),
                  Text("schinner@ui8.net", style: AllStyle.text6),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    //padding: const EdgeInsets.all(15),
                    height: 33,
                    width: 110,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1.5),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: const Center(child: Text("level 2 verified")),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  GestureDetector(
                      onTap: () {
                        //Get.to(Change Password)
                        Get.to(const ChangePassword());
                      },
                      child: Text("Change Password", style: AllStyle.text2)),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            //Get.to(NotificationPage)
                          },
                          child: Text("Notifications", style: AllStyle.text2)),
                      //i am pushing the switch far away
                      Expanded(
                        child: Container(),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        //change this color
                        activeTrackColor: Colors.blue,
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(const FAQ());
                      },
                      child: Text("FAQ", style: AllStyle.text2)),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(const TermsAndCondition());
                      },
                      child:
                          Text("Terms and Conditions", style: AllStyle.text2)),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(const IntroductionScreen());
                      },
                      child: Text("Log out", style: AllStyle.avatarColor)),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
