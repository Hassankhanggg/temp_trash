import 'package:flutter/material.dart';

import 'colors.dart';

class ChooseCategory extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final Function onTap;
  const ChooseCategory(
      {Key key, this.onTap, this.name, this.description, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      elevation: 5.0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/$image"),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
