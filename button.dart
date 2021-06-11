import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishare/utills/colors.dart';

class AppButton extends StatelessWidget {
  final name;
  final width;
  final Function onTap;
  final bool isIcon;
  AppButton(
      {@required this.onTap,
      @required this.name,
      this.isIcon = false,
      this.width = 0.6});
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    return Container(
      width: query.width * width,
      height: 40.0,
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onTap: onTap,
        child: Center(
          child: isIcon
              ? Icon(
                  CupertinoIcons.arrow_right,
                  color: AppColors().white,
                  size: 24,
                )
              : Text(
                  name,
                  style: TextStyle(
                      color: AppColors().white, fontWeight: FontWeight.w500),
                ),
        ),
      ),
      decoration: BoxDecoration(
          gradient: AppColors().gradeintColors,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5),
            )
          ]),
    );
  }
}
