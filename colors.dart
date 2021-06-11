import 'package:flutter/material.dart';

class AppColors {
  final Alignment begin;
  final Alignment end;
  final context;
  AppColors(
      {this.context,
      this.begin = Alignment.centerLeft,
      this.end = Alignment.centerRight});
  get gradeintColors {
    return LinearGradient(colors: [
      Color.fromRGBO(0, 188, 211, 1),
      Color.fromRGBO(0, 123, 155, 1)
    ], begin: begin, end: end);
  }

  get white {
    return Color(0xFEFEFEFE);
  }

  get iconColor {
    return Theme.of(context).iconTheme.color;
  }

  Color liteColorWithOpacity(double x) {
    return Color.fromRGBO(0, 177, 201, 1).withOpacity(x);
  }

  Color deepColorWithOpacity(double x) {
    return Color.fromRGBO(0, 123, 155, 1).withOpacity(x);
  }

  get black54 {
    return Colors.black54;
  }

  get black {
    return Colors.black87;
  }
}
