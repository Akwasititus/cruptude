import 'package:flutter/material.dart';

Widget myButtons(String string,  Color color) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: color,
    ),
    child: Text(string),
  );
}
