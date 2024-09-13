import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedUserData {
  static getUsername() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  static getUserToken() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}

// class SavedUserDataLogin {
//   static getSavedId() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedId = prefs.getString('userNameLogin');
//     return savedId;
//   }
//
//   static getUserToken() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('savedUserAuthTokenLogin');
//     return token;
//   }
// }
