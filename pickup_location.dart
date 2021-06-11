import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishare/utills/AppBar/button.dart';
import 'package:ishare/utills/Maps/map.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/colors.dart';

class PickupLocation extends StatefulWidget {
  @override
  _PickupLocationState createState() => _PickupLocationState();
}

class _PickupLocationState extends State<PickupLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: AppBarButton(
            onTap: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
            icon: CupertinoIcons.arrow_left),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter)
                .gradeintColors,
          ),
        ),
        title: Text(
          "Map",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Maps(
        flag: true,
      ),
    );
  }
}
