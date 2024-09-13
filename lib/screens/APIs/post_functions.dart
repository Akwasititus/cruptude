import 'dart:convert';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/utils.dart';
import '../landing_page/home_screen.dart';
import '../recovery/otp.dart';
import '../sharePref/shareP.dart';

class AuthPostRequests {
  // Registration function
  static registerUser(Map _data) async {
    try {
      EasyLoading.show(status: 'signing up...');
      //Hitting endpoint and setting Timeout
      http.Response response = await http
          .post(Uri.parse(base_url + "/api/v1/accounts/register"), body: _data);

      //-- Conditional statements
      if (response.statusCode == 201) {
        var resData = json.decode(response.body);
        // Redirecting to success page
        EasyLoading.showSuccess(resData["message"]);

        EasyLoading.dismiss();
        Get.off(() => EnterOTP(), arguments: resData["data"]["email"]);
      } else {
        // Decoding JSONResponse
        var message = json.decode(response.body)["message"];

        // Displaying Error with Getx Dialog
        EasyLoading.showInfo('$message');
        EasyLoading.dismiss();
        return null;
      }
    } on SocketException {
      // Displaying Exception with Getx Dialog
      EasyLoading.showInfo(
          'No Internet \n Please check your internet connectivity and try again');
      EasyLoading.dismiss();
      return null;
    }
  }

  // Verify Account function
  static accountVerification(String email, String code) async {
    try {
      EasyLoading.show(status: 'Verifying Account...');
      //Hitting endpoint and setting Timeout
      http.Response response = await http
          .get(Uri.parse(base_url + "/api/v1/accounts/verify/$email/$code"));

      //-- Conditional statements
      if (response.statusCode == 200) {
        var resData = json.decode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('usertoken', resData["token"]);
        prefs.setString('username', resData["username"].toString());
        Constants.prefs?.setBool("loggedIn", true);
        EasyLoading.showSuccess(resData["message"]);
        // Redirecting to success page
        EasyLoading.dismiss();
        Get.off(() => HomeScreen());
      } else {
        // Decoding JSONResponse
        var message = json.decode(response.body)["message"];

        // Displaying Error with Getx Dialog
        EasyLoading.showInfo('$message');
        EasyLoading.dismiss();
        return null;
      }
    } on SocketException {
      // Displaying Exception with Getx Dialog
      EasyLoading.showInfo(
          'No Internet \n Please check your internet connectivity and try again');
      EasyLoading.dismiss();
      return null;
    }
  }

  // login
  static loginUser(Map _data) async {
    try {
      EasyLoading.show(status: 'Logging In...');
      //Hitting endpoint and setting Timeout
      http.Response response = await http
          .post(Uri.parse(base_url + "/api/v1/accounts/login"), body: _data);

      //-- Conditional statements
      if (response.statusCode == 201) {
        // Decoding JSONResponse
        var resData = json.decode(response.body);

        // Saving some resData in shared preference
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', resData["token"]);
        prefs.setString('username', resData["username"]);
        prefs.setBool("loggedIn", true);
        EasyLoading.dismiss();
        // Redirecting User
        Get.offAll(() => HomeScreen());
      } else if (response.statusCode == 400) {
        EasyLoading.showInfo("Email not verify. Please verify before login");
        // Get.to(() => RegisterAuthCodePage(), arguments: _data["email"]);
      } else {
        // Decoding JSONResponse
        var message = json.decode(response.body)["message"];
        EasyLoading.showError('$message');
        EasyLoading.dismiss();
        return null;
      }
    } on SocketException {
      // Displaying Exception with Getx Dialog
      EasyLoading.showInfo(
          'No Internet \n Please check your internet connectivity and try again');
      EasyLoading.dismiss();
      return null;
    }
  }

  // static logoutUser() async {
  //   try {
  //     EasyLoading.show(status: 'logging out...');
  //
  //     final token = await SavedUserData.getUserToken();
  //     http.Response response = await http
  //     //check endpoint here and change
  //         .post(Uri.parse(base_url + "/api/logout"), headers: {
  //       HttpHeaders.authorizationHeader: "Bearer $token"
  //     });
  //
  //     //Conditional statements
  //     if (response.statusCode == 200) {
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.remove('userName');
  //       prefs.remove('userNameLogin');
  //       prefs.remove('savedUserAuthToken');
  //       await Constants.prefs?.setBool("loggedIn", false);
  //       EasyLoading.dismiss();
  //       Get.offAll(() => Login());
  //     } else {
  //       return null;
  //     }
  //   } on SocketException {
  //     // Displaying Exception with Getx Dialog
  //     EasyLoading.showInfo(
  //         'No Internet \n Please check your internet connectivity and try again');
  //     EasyLoading.dismiss();
  //   }
  // }
}
