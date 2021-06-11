import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/home.dart';
import 'package:ishare/screens/signup.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/colors.dart';
import 'package:ishare/utills/text_feild.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(_query.size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _query.size.height * 0.2,
              ),
              Text(
                'Login',
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(
                height: _query.size.height * 0.025,
              ),
              AppTextFeild(
                controller: userName,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter your Email or Username',
                labelText: 'Email or Username',
              ),
              AppTextFeild(
                keyboardType: TextInputType.visiblePassword,
                controller: password,
                isPassword: true,
                hintText: 'Enter your Password',
                labelText: 'Password',
              ),
              SizedBox(
                height: _query.size.height * 0.025,
              ),
              Center(
                child: AppButton(
                  name: 'Login',
                  width: 0.65,
                  onTap: () {
                    Get.to(() => Home());
                  },
                ),
              ),
              SizedBox(
                height: _query.size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _query.size.width * 0.025,
                  ),
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w100),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => SignUp());
                    },
                    child: Text(
                      'Sign Up',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
