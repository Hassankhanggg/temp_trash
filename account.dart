import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/welcome.dart';
import 'package:ishare/utills/AppBar/button.dart';
import 'package:ishare/utills/AppDrawer/drawer.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/colors.dart';
import 'package:ishare/utills/profile.dart';
import 'package:ishare/utills/text_feild.dart';
import 'dart:ui';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool spinner = false;
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastNAme = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String valueChoose;
  List listItems = ["Kilometers", "Mile"];
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    FirstName.text = "Hassan";
    LastNAme.text = "Khan";
    phoneNumber.text = "031333";
    emailAddress.text = "Hassankhanggg@gmail.com";
    return Scaffold(
      drawer: AppDrawer(),
      key: _drawerKey,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter)
                .gradeintColors,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: AppBarButton(
            onTap: () => _drawerKey.currentState.openDrawer(),
            icon: CupertinoIcons.line_horizontal_3),
        title: Text(
          "My Account",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          AppBarButton(
            onTap: () {
              Get.offAll(WelcomeScreen());
            },
            icon: CupertinoIcons.square_arrow_right,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  padding: EdgeInsets.all(query.size.width * 0.05),
                  children: [
                    UserProfile(
                      userEmail: "hassan@email.com",
                      userName: "Hassan",
                      userImage:
                          "https://cdn2.iconfinder.com/data/icons/avatars-99/62/avatar-370-456322-512.png",
                    ),
                    Text(
                      "First name",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    AppTextFeild(
                      keyboardType: TextInputType.name,
                      controller: FirstName,
                    ),
                    Text(
                      "List name",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    AppTextFeild(
                      keyboardType: TextInputType.name,
                      controller: LastNAme,
                    ),
                    Text(
                      "Email address",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    AppTextFeild(
                      keyboardType: TextInputType.text,
                      controller: emailAddress,
                    ),
                    Text(
                      "Phone number",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    AppTextFeild(
                      keyboardType: TextInputType.number,
                      controller: phoneNumber,
                    ),
                    Row(
                      children: [
                        Text(
                          "Distance unit",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          size: 26,
                        ),
                        SizedBox(
                          width: query.size.height * 0.25,
                        ),
                        DropdownButton(
                          hint: Text("Select"),
                          value: valueChoose,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose = newValue;
                            });
                          },
                          items: listItems.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: query.size.height * 0.07,
                    ),
                  ]),
            ),
          ],
        ),
      ),
      floatingActionButton: AppButton(
        name: 'Save Account',
        onTap: () {},
        width: 0.9,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
