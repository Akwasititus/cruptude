import 'package:flutter/material.dart';

class NotificationModel {
  String notificationHeader;
  String notificationDesc;

  NotificationModel({
    required this.notificationHeader,
    required this.notificationDesc,
  });
}

List<NotificationModel> getNotificationModel = [
  NotificationModel(
    notificationHeader: "Login attempted from new IP",
    notificationDesc: "Hello, you've reset the Google Authentication\n "
        "on your account successfully.",
  ),
  NotificationModel(
    notificationHeader: "Login attempted from new IP",
    notificationDesc: "Hello, you've reset the Google Authentication \n"
        "on your account successfully.",
  ),
  NotificationModel(
    notificationHeader: "Login attempted from new IP",
    notificationDesc: "Hello, you've reset the Google Authentication\n"
        " on your account successfully.",
  ),
  NotificationModel(
    notificationHeader: "Login attempted from new IP",
    notificationDesc: "Hello, you've reset the Google Authentication\n"
        " on your account successfully.",
  ),
  NotificationModel(
    notificationHeader: "Login attempted from new IP",
    notificationDesc: "Hello, you've reset the Google Authentication\n"
        " on your account successfully.",
  ),
];
