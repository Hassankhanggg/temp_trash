import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/text_feild.dart';

class SignUpDetails extends StatefulWidget {
  @override
  _SignUpDetailsState createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  bool spinner = false;
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController jobTitle = TextEditingController();

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
                        height: query.size.height * 0.05,
                      ),
                      Text(
                        'SignUp',
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                      SizedBox(
                        height: query.size.height * 0.025,
                      ),
                      AppTextFeild(
                        keyboardType: TextInputType.name,
                        controller: fullName,
                        hintText: 'Enter your Full Name',
                        labelText: 'Full Name',
                      ),
                      AppTextFeild(
                        keyboardType: TextInputType.streetAddress,
                        controller: address,
                        hintText: 'Enter your Address',
                        labelText: 'Address',
                      ),
                      AppTextFeild(
                        keyboardType: TextInputType.text,
                        controller: city,
                        hintText: 'Enter your City',
                        labelText: 'City',
                      ),
                      AppTextFeild(
                        keyboardType: TextInputType.number,
                        controller: postalCode,
                        hintText: 'Enter your Postal Code',
                        labelText: 'Postal Code',
                      ),
                      AppTextFeild(
                        keyboardType: TextInputType.phone,
                        controller: phoneNumber,
                        hintText: 'Enter your Phone Number',
                        labelText: 'Phone Number',
                      ),
                      AppTextFeild(
                        keyboardType: TextInputType.text,
                        controller: jobTitle,
                        hintText: 'Enter your Job Title',
                        labelText: 'Job Title',
                      ),

                    ],
                  ),
              SizedBox(
                height: query.size.height * 0.025,
              ),
              AppButton(
                name: 'Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, '/WelcomeScreen');
                },
                width: query.size.width * 0.55,
              ),
              SizedBox(
                height: query.size.height * 0.025,
              )
            ],
          ),
        ),
      ),
    );
  }
}
