import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/account.dart';
import 'package:ishare/screens/home.dart';
import 'package:ishare/utills/AppDrawer/drawerElement.dart';
import 'package:ishare/utills/colors.dart';
import 'package:ishare/utills/profile.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool select = false;
  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context).size;
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: AppColors(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter)
                    .gradeintColors),
          ),
          SafeArea(
            child: Column(
              children: [
                UserProfile(
                  userEmail: "hassan@email.com",
                  userName: "Hassan",
                  userImage:
                      "https://cdn2.iconfinder.com/data/icons/avatars-99/62/avatar-370-456322-512.png",
                ),
                Expanded(
                  child: ListView(
                    children: [
                      DrawerElement(
                        onTap: () {},
                        name: "Home",
                        icon: CupertinoIcons.home,
                        isSelected: select,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "My Impact",
                        icon: CupertinoIcons.smallcircle_fill_circle,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "My badges",
                        icon: CupertinoIcons.person_crop_circle_badge_checkmark,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "My Listing",
                        icon: CupertinoIcons.list_bullet,
                      ),
                      DrawerElement(
                        onTap: () {
                          Get.to(() => AccountSettings());
                        },
                        name: "Profile",
                        icon: CupertinoIcons.smiley,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "My account",
                        icon: CupertinoIcons.person,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "Notifications",
                        icon: CupertinoIcons.bell,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "Settings",
                        icon: CupertinoIcons.settings,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "Location",
                        icon: CupertinoIcons.location,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "Help Center",
                        icon: Icons.help,
                      ),
                      DrawerElement(
                        onTap: () {},
                        name: "Users near me",
                        icon: CupertinoIcons.question_circle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
