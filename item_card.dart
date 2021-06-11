import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishare/utills/colors.dart';

class ItemCard extends StatelessWidget {
  final Function onTap;
  final String itemImage;
  final String itemName;
  final String likes;
  final String userImage;
  final String userName;
  final String rating;
  final String distance;
  final String views;
  final double width;
  const ItemCard(
      {Key key,
      this.itemImage,
      this.onTap,
      this.itemName,
      this.likes,
      this.userImage,
      this.userName,
      this.rating,
      this.distance,
      this.views,
      this.width = 0.9})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onTap: onTap,
        child: Container(
          width: _query.width * width,
          height: 130,
          decoration: BoxDecoration(
              color: AppColors().white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                )
              ]),
          child: Row(
            children: [
              Container(
                //alignment: Alignment.centerLeft,
                width: _query.width * 0.4,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  image: DecorationImage(
                    image: NetworkImage(itemImage),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black45,
                            Colors.transparent,
                            Colors.transparent
                          ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          CupertinoIcons.heart,
                          color: AppColors().white,
                          size: 24.0,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          likes,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors().white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: _query.width * 0.04,
              ),
              Container(
                width: _query.width * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Text(
                        itemName,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10.5,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: _query.height / _query.width * 6,
                          backgroundImage: NetworkImage(userImage),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          userName,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.yellow.shade700,
                          size: 16,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(rating)
                      ],
                    ),
                    SizedBox(
                      height: 10.5,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          color: AppColors(context: context).iconColor,
                          size: 18.0,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(distance),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          CupertinoIcons.eye,
                          color: AppColors(context: context).iconColor,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(views),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
