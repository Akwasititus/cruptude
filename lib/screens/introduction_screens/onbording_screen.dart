import 'dart:async';

import 'package:cryptude/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'introduction_screen_banks/onbording_bank.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  // late String finalEmail;
  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainedEmail = sharedPreferences.getString("email");
  //   setState(() {
  //     finalEmail = obtainedEmail!;
  //   });
  // }

  @override
  void initState() {
    //methode validation to check if a user has already sign in before
    // getValidationData().whenComplete(() {
    //   Get.toNamed(finalEmail == null ? '/login' : '/homeScreen');
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 270),
          child: Column(children: [
            Column(
              children: [
                Image.asset(
                  'images/wallet_icon.png',
                  height: 150,
                  width: 150,
                ),
                Text(
                  "Sell your Crypto",
                  style: AllStyle.text11,
                ),
                Center(
                  child: Text(
                    "Sell your Crypto and Gift Card for\n"
                    "instant cash on the most secured \n"
                    "Platform\n",
                    textAlign: TextAlign.center,
                    style: AllStyle.text9,
                  ),
                ),
              ],
            ),

            // this column holds the the two buttons
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offNamed('/login');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceSize.width * 0.1),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: MyButtons.loginButton,
                      child: Center(
                        child: Text(
                          'Login',
                          style: AllStyle.buttonTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Get.offNamed('/registerScreen');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceSize.width * 0.1,
                      ),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: MyButtons.loginButtonWithBorders,
                        child: Center(
                          child: Text(
                            'Register',
                            style: AllStyle.buttonTextStyle4Register,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ]),
        )),
      ),
    );
  }
}
