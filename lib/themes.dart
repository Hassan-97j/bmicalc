import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF570606);
final Color secondaryColor = Colors.white;
final Color primaryTextColor = Colors.black;
final double titleFontSize = 24.0;

TextStyle setTextStyle(
    {color = Colors.white, double size = 14, weight = FontWeight.normal}) {
  return TextStyle(
    fontWeight: weight,
    color: color,
    fontSize: size,
  );
}
