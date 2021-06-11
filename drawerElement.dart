import 'package:flutter/material.dart';

import '../colors.dart';

class DrawerElement extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final String name;
  final bool isSelected;

  DrawerElement(
      {this.icon,
      @required this.onTap,
      @required this.name,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 20.0),
      child: InkWell(
          customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(left: 30),
            decoration: BoxDecoration(
                color: isSelected ? AppColors().white : Colors.transparent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
            height: 50,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: isSelected
                      ? AppColors(context: context).iconColor
                      : AppColors().white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(name,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: isSelected
                          ? AppColors(context: context).iconColor
                          : AppColors().white,
                    ))
              ],
            ),
          )),
    );
  }
}
