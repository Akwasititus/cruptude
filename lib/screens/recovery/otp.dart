import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../constants/utils.dart';
import '../APIs/post_functions.dart';

class EnterOTP extends StatefulWidget {
  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  var _email = Get.arguments;
  var _globalPin;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: Container(
        width: deviceSize.width,
        child: OTPTextField(
          length: 5,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 30,
          style: const TextStyle(fontSize: 17),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            setState(() {
              _globalPin = pin;
              AuthPostRequests.accountVerification(_email, pin);
            });
          },
        ),
      ),
    );
  }
}
