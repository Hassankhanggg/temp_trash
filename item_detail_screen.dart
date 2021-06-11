import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ishare/screens/agreement.dart';
import 'package:ishare/utills/AppBar/button.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/colors.dart';
import 'package:location/location.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class ItemDetailScreen extends StatefulWidget {
  ItemDetailScreen({Key key}) : super(key: key);

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  bool isLike = false;
  String itemName = 'Shoes';
  String userName = 'Mubashir';
  String time = '10 Hours';

  List itemImages = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];
  String userImage =
      'https://m.media-amazon.com/images/M/MV5BNThlNTkxMTYtMmYwOC00MDk4LTlkNjYtYTJkNDJiNTJlMTAwXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_UY1200_CR99,0,630,1200_AL_.jpg';
  String rating = '4.5';
  String action = 'Donating';
  int likes = 7821;
  int shares = 5662;

  final Location location = Location();
  LatLng _currentLocation = LatLng(34, 71);

  bool _loading = false;
  CarouselSlider carouselSlider;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: AppBarButton(
              onTap: () {
                Navigator.pop(context);
              },
              icon: CupertinoIcons.arrow_left),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppColors(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter)
                  .gradeintColors,
            ),
          ),
          title: Text(itemName, style: TextStyle(fontSize: 26.0)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  print('Flag Pressed');
                },
                child: Icon(
                  CupertinoIcons.flag,
                ),
              ),
            )
          ]),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
        children: [
          CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: itemImages
                .map((item) => Container(
                      height: _query.height * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black54,
                                  Colors.black38,
                                  Colors.transparent,
                                  Colors.transparent
                                ])),
                        child: Container(
                          color: Colors.transparent,
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              likes = isLike
                                                  ? likes - 1
                                                  : likes + 1;
                                              isLike = isLike ? false : true;
                                            });
                                          },
                                          customBorder: CircleBorder(),
                                          child: Icon(
                                            isLike
                                                ? CupertinoIcons.heart_fill
                                                : CupertinoIcons.heart,
                                            color: AppColors().white,
                                            size: 30,
                                          )),
                                    ),
                                    SizedBox(
                                      width: _query.width * 0.01,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 1.0),
                                      child: Text(
                                        '${_calculator(likes)}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors().white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              shares++;
                                            });
                                          },
                                          customBorder: CircleBorder(),
                                          child: Icon(
                                            CupertinoIcons
                                                .arrowshape_turn_up_right,
                                            color: AppColors().white,
                                            size: 30,
                                          )),
                                    ),
                                    SizedBox(
                                      width: _query.width * 0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 1.0, right: 8.0),
                                      child: Text(
                                        '${_calculator(shares)}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors().white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: _query.height * 0.15,
            decoration: _boxDecoration(),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(userImage),
                          maxRadius: _query.width * 0.085,
                        ),
                      ),
                      Positioned(
                        //top: 0,
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Container(
                          width: 20.0,
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade700,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.star_fill,
                                color: AppColors().black,
                                size: 16.0,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                rating,
                                style: TextStyle(
                                    fontSize: 13.0, color: AppColors().black),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${userName} is ${action}',
                          style: TextStyle(fontSize: 16.0)),
                      Text(
                        itemName,
                        style: TextStyle(fontSize: 30.0),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Added ${time} ago',
                        style: TextStyle(fontSize: 16.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            //height: _query.height * 0.1,
            decoration: _boxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(fontSize: 18.0),
                ),
                Text("description", style: TextStyle(fontSize: 16.0)),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: _boxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Pick up times',
                  style: TextStyle(fontSize: 18.0),
                ),
                Text("4-6pm morning", style: TextStyle(fontSize: 16.0)),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              //print();
              //Get.to(MapScreen(flag:true));
            },
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              decoration: _boxDecoration(),
              child: Column(
                children: [
                  _customRow(title: "Location"),
                  _loading
                      ? Container(
                          height: _query.height * 0.3,
                          color: AppColors().white,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors().liteColorWithOpacity(1),
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 16.0),
                              height: _query.height * 0.3,
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: _currentLocation,
                                  zoom: 10.0,
                                ),
                                mapType: MapType.normal,
                              ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Icon(
                                  CupertinoIcons.location,
                                  color: AppColors().liteColorWithOpacity(1),
                                  size: 30,
                                ))
                          ],
                        )
                ],
              ),
            ),
          ),
          SizedBox(height: _query.height * 0.05),
        ],
      ),
      floatingActionButton: AppButton(
        onTap: () {
          Get.to(() => Agreement());
        },
        name: "Request for this",
        width: 0.8,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _boxDecoration() {
    return BoxDecoration(
        color: AppColors().white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 16,
            offset: Offset(0, 5),
          )
        ]);
  }

  _customRow({String title}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Icon(
          CupertinoIcons.right_chevron,
          color: AppColors(context: context).iconColor,
          size: 22.0,
        )
      ],
    );
  }

  String _calculator(int x) {
    double temp;
    String s = "";
    if (x <= 999) temp = x.toDouble();
    if (x > 999 && x <= 999999) {
      temp = x / 1000;
      s = "K";
    }
    if (x > 999999) {
      temp = x / 1000;
      s = "M";
    }

    return temp.toStringAsFixed(1) + s;
  }
}
