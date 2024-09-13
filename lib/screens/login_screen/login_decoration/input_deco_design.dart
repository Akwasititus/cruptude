import 'package:flutter/material.dart';

import '../../../constants/utils.dart';

InputDecoration buildInputDecoration(
  String hintText,
) {
  return InputDecoration(
    hintText: hintText,
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(22)),
      borderSide: BorderSide(width: 2.2, color: Colors.grey),
    ),
    hintStyle: AllStyle.text6,
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: Colors.grey, width: 1.2),
    ),
  );
}
