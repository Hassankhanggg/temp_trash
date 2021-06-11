import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ishare/utills/AppBar/button.dart';
import 'package:ishare/utills/AppDrawer/drawer.dart';
import 'package:ishare/utills/Maps/map.dart';
import 'package:ishare/utills/bottom_navbar.dart';
import 'package:ishare/utills/colors.dart';

class MapScreen extends StatefulWidget {
  MapScreen() : super();

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _drawerKey,
        appBar: _appBar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [Maps(), Maps(), Maps()],
        ),
        bottomNavigationBar: BottomNavBar(),
        drawer: AppDrawer(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: AppBarButton(
          onTap: () => _drawerKey.currentState.openDrawer(),
          icon: CupertinoIcons.line_horizontal_3),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient:
              AppColors(begin: Alignment.topCenter, end: Alignment.bottomCenter)
                  .gradeintColors,
        ),
      ),
      title: Text("Users Nearby",style: TextStyle(fontSize: 24.0)),
      centerTitle: true,
      bottom: TabBar(
        indicatorColor: AppColors().white,
        tabs: [
          Tab(
              icon: Text(
            'All',
            style: TextStyle(
                color: AppColors().white, fontWeight: FontWeight.bold),
          )),
          Tab(
              icon: Text('Home',
                  style: TextStyle(
                      color: AppColors().white, fontWeight: FontWeight.bold))),
          Tab(
              icon: Text('Requests',
                  style: TextStyle(
                      color: AppColors().white, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
