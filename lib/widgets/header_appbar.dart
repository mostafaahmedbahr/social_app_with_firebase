import 'package:flutter/material.dart';

AppBar header(BuildContext context, {
  required String title,
  required bool centerTitle,
  required Color color,
})
{
  return AppBar(
    title: Text(title,
    style: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: "Signatra",
    ),),
    centerTitle: centerTitle,
    backgroundColor: color,
  );
}