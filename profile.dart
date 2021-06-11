import 'package:flutter/material.dart';
import 'package:ishare/utills/colors.dart';

class UserProfile extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userImage;

  UserProfile({this.userEmail, this.userName, this.userImage});

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: _query.height / _query.width * 23,
            backgroundImage: AssetImage(
              "assets/images/defaultProfile.png",
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: _query.height / _query.width * 22,
              backgroundImage: NetworkImage(
                userImage,
              ),
            ),
          ),
          SizedBox(
            height: _query.height * 0.01,
          ),
          Text(
            userName,
            style: TextStyle(fontSize: 24, color: AppColors().white),
          ),
          Text(
            userEmail,
            style: TextStyle(fontSize: 14, color: AppColors().white),
          )
        ],
      ),
    );
  }
}
