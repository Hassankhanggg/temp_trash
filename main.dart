import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/ChatScreen.dart';
import 'package:ishare/screens/add_item_details.dart';
import 'package:ishare/screens/agreement.dart';
import 'package:ishare/screens/home.dart';
import 'package:ishare/screens/login.dart';
import 'package:ishare/screens/signup.dart';
import 'package:ishare/theme/ishare_theme.dart';

import 'screens/agreement.dart';
import 'screens/welcome.dart';

void main() {
  runApp(ISHARE());
}

class ISHARE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
      theme: AppTheme.lightTheme(),
    );
  }
}
