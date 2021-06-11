import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/colors.dart';
import 'package:ishare/utills/text_feild.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool spinner = false;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(query.size.width * 0.05),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: query.size.height * 0.2,
                  ),
                  Text(
                    'SignUp',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                  SizedBox(
                    height: query.size.height * 0.025,
                  ),
                  AppTextFeild(
                    keyboardType: TextInputType.text,
                    controller: userName,
                    hintText: 'Enter your Username',
                    labelText: 'Username',
                  ),
                  AppTextFeild(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    hintText: 'Enter your Email',
                    labelText: 'Email',
                  ),
                  AppTextFeild(
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                    isPassword: true,
                    hintText: 'Enter your Password',
                    labelText: 'Password',
                  ),
                                      ],
                  ),
              SizedBox(
                height: query.size.height * 0.025,
              ),
              AppButton(
                  name: 'Next',
                  onTap: () {
                    Navigator.pushNamed(context, '/SignUpDetails');
                  },
                  width: query.size.width * 0.55
              ),
              SizedBox(
                height: query.size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w100),
                  ),
                  TextButton(
                    style: ButtonStyle(overlayColor:
                    MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.grey.withOpacity(0.1);
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed))
                            return Colors.grey.withOpacity(0.3);
                          return null;
                        })),
                    onPressed: () {
                      Navigator.pushNamed(context, '/LoginScreen');
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}
