import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/login.dart';
import 'package:ishare/screens/signup.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/colors.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            bottom: _query.size.height * 0.1, top: _query.size.height * 0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to',
                        style: TextStyle(
                            color: AppColors().black54, fontSize: 28.0),
                      ),
                      Text(
                        ' iShare',
                        style: TextStyle(
                            color: AppColors().black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                  Text(
                    'Share more, Care more',
                    style:
                        TextStyle(color: AppColors().black54, fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Expanded(child: Image.asset('assets/images/bgImage.png')),
            Expanded(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              AppButton(
                  onTap: () {
                    Get.to(() => Login());
                  },
                  width: 0.8,
                  name: 'Log in'),
              SizedBox(
                height: _query.size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignUp());
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black54),
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
