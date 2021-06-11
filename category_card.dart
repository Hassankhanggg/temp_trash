import 'package:flutter/material.dart';
import 'package:ishare/utills/colors.dart';

class Category extends StatelessWidget {
  final String src;
  final Function onTap;
  final String name;
  final double width;
  Category(
      {Key key,
      @required this.src,
      @required this.onTap,
      @required this.name,
      this.width = 0.4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context).size;
    return Container(
      width: _query.width * width,
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        image: DecorationImage(
          image: AssetImage(src),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Color.fromRGBO(5, 5, 5, 0.5),
            ),
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors().white),
            )),
      ),
    );
  }
}
