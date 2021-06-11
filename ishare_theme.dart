import 'package:flutter/material.dart';
import 'package:ishare/utills/colors.dart';

class AppTheme {
  static final AppTheme _instance = new AppTheme.internal();
  factory AppTheme() => _instance;
  AppTheme.internal();

  static ThemeData lightTheme() {
    return new ThemeData(
        splashColor: AppColors().deepColorWithOpacity(1),
        iconTheme: IconThemeData(color: Colors.grey.shade700),
        fontFamily: 'Cerebri',
        textTheme: TextTheme(headline1: TextStyle(fontSize: 18)),
        focusColor: Colors.grey);
  }

  static ThemeData darkTheme() {
    return new ThemeData(
      fontFamily: 'Cerebri',
      textTheme: TextTheme(headline1: TextStyle(fontSize: 18)),
    );
  }
}
