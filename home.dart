import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/choose_category_screen.dart';
import 'package:ishare/utills/AppBar/button.dart';
import 'package:ishare/utills/AppDrawer/drawer.dart';
import 'package:ishare/utills/bottom_navbar.dart';
import 'package:ishare/utills/category_card.dart';
import 'package:ishare/utills/colors.dart';
import 'package:ishare/utills/custome_widget_home.dart';
import 'package:ishare/utills/item_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();
  bool isSearch = false;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _drawerKey,
        appBar: _appBar(),
        body: TabBarView(
          children: [
            CustomeWidgetHome(),
            CustomeWidgetHome(),
            CustomeWidgetHome()
          ],
        ),
        // Disable opening the drawer with a swipe gesture.
        //drawerEnableOpenDragGesture: false,
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => print(""),
              icon: Icon(
                CupertinoIcons.heart_fill,
                size: 35,
              ),
              color: AppColors().liteColorWithOpacity(1),
            ),
            SizedBox(
              height: 8.0,
            ),
            FloatingActionButton(
                mini: true,
                heroTag: null,
                child: Icon(CupertinoIcons.add),
                backgroundColor: AppColors().liteColorWithOpacity(1),
                onPressed: () {
                  Get.to(ChooseCategoryScreen());
                }),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient:
              AppColors(begin: Alignment.topCenter, end: Alignment.bottomCenter)
                  .gradeintColors,
        ),
      ),
      title: isSearch
          ? TextField(
              controller: _searchController,
              autofocus: true,
              cursorColor: AppColors().white,
              cursorHeight: 25.0,
              style: TextStyle(fontSize: 16, color: AppColors().white),
              decoration: InputDecoration(
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearch = isSearch ? false : true;
                      });
                    },
                    icon: Icon(
                      CupertinoIcons.search,
                      color: AppColors().white,
                    ),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: AppColors().white),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors().white)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors().white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors().white)),
                  hoverColor: AppColors().white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppBarButton(
                    onTap: () => _drawerKey.currentState.openDrawer(),
                    icon: CupertinoIcons.line_horizontal_3),
                Spacer(),
                AppBarButton(
                    onTap: () {
                      setState(() {
                        isSearch = isSearch ? false : true;
                      });
                    },
                    icon: CupertinoIcons.search),
                AppBarButton(
                    onTap: () => print("Notification"),
                    icon: CupertinoIcons.bell),
                AppBarButton(
                    onTap: () => print("Help"),
                    icon: CupertinoIcons.question_circle)
              ],
            ),
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
