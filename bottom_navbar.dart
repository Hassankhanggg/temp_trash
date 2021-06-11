import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/home.dart';
import 'package:ishare/screens/map_screen.dart';
import 'package:ishare/utills/AppControllers/bottomNavControoler.dart';
import 'package:ishare/utills/colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _bottomNavController = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    int _currentIndex = _bottomNavController.index;
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      curve: Curves.linear,
      animationDuration: Duration(microseconds: 60),
      onItemSelected: (index) {
        setState(() {
          _bottomNavController.toggleElement(index);
          if (index == 0)
            Get.off(() => Home());
          else if (index == 1) Get.off(() => MapScreen());
        });
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text("Home"),
            activeColor: _currentIndex == 0
                ? AppColors().liteColorWithOpacity(1)
                : AppColors().black),
        BottomNavyBarItem(
            icon: Icon(CupertinoIcons.location),
            title: Text("Map"),
            activeColor: _currentIndex == 1
                ? AppColors().liteColorWithOpacity(1)
                : AppColors().black),
        BottomNavyBarItem(
            icon: Icon(CupertinoIcons.rectangle_on_rectangle_angled),
            title: Text("Goals"),
            activeColor: _currentIndex == 2
                ? AppColors().liteColorWithOpacity(1)
                : AppColors().black),
        BottomNavyBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            title: Text("Forum"),
            activeColor: _currentIndex == 3
                ? AppColors().liteColorWithOpacity(1)
                : AppColors().black),
        BottomNavyBarItem(
            icon: Icon(CupertinoIcons.envelope),
            title: Text("Messages"),
            activeColor: _currentIndex == 4
                ? AppColors().liteColorWithOpacity(1)
                : AppColors().black),
      ],
    );
  }
}
