import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishare/utills/colors.dart';

class AppTextFeild extends StatefulWidget {
  final controller;
  final isPassword;
  final hintText;
  final labelText;
  final keyboardType;

  AppTextFeild(
      {@required this.controller,
      this.keyboardType,
      this.isPassword = false,
      this.hintText,
      this.labelText});

  @override
  _AppTextFeildState createState() => _AppTextFeildState(
      controller: controller,
      isPassword: isPassword,
      hintText: hintText,
      keyboardType: keyboardType,
      labelText: labelText);
}

class _AppTextFeildState extends State<AppTextFeild> {
  final controller;
  final keyboardType;
  final isPassword;
  final hintText;
  final labelText;

  _AppTextFeildState(
      {@required this.controller,
      this.keyboardType,
      this.isPassword = false,
      this.hintText,
      this.labelText});

  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context).size;
    return Container(
      width: _query.width * 0.86,
      height: 100,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword ? _isHidden : false,
        cursorColor: Color.fromRGBO(168, 168, 168, 1),
        cursorHeight: 20.0,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            suffix: isPassword
                ? IconButton(
                    onPressed: _togglePasswordView,
                    icon: Icon(
                      _isHidden ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                      color: AppColors(context: context).iconColor,
                      size: 18.0,
                    ),
                  )
                : Text(""),
            labelText: labelText,
            labelStyle: TextStyle(color: Color.fromRGBO(166, 166, 166, 1)),
            hintText: hintText,
            hintStyle: TextStyle(color: Color.fromRGBO(166, 166, 166, 1)),
            border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(166, 166, 166, 1))),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(166, 166, 166, 1))),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(166, 166, 166, 1))),
            hoverColor: Colors.grey),
      ),
    );
  }
}
