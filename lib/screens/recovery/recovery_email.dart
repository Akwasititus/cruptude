import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/utils.dart';
import '../landing_page/home_screen.dart';
import '../login_screen/login_decoration/input_deco_design.dart';
import 'otp.dart';

class RecoveryEmail extends StatefulWidget {
  const RecoveryEmail({Key? key}) : super(key: key);

  @override
  _RecoveryEmailState createState() => _RecoveryEmailState();
}

class _RecoveryEmailState extends State<RecoveryEmail> {
  late String name, email, phone;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20),
              child: Text(
                "Recovery",
                style: AllStyle.text14,
              ),
            ),
            Text(
              "Enter Email to receive recovery code ",
              style: AllStyle.text9,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email', style: AllStyle.text6),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: RegisterStyles.subBody1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: buildInputDecoration("Cadilax@gmail.com"),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Text(
                    "By pressing Button below, you'll get an email \n with recovery code. "
                    "Input this code on the next page to reset your password.",
                    textAlign: TextAlign.center,
                    style: AllStyle.text9,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/enterOTP');
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: MyButtons.loginButton,
                    child: Center(
                      child:
                          Text('Get the Code', style: AllStyle.buttonTextStyle),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
