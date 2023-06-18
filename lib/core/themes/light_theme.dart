import 'package:expense_tracker_client/core/enums/color_enum.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorEnum.starDust.value),
      displayMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade900),
    ));
