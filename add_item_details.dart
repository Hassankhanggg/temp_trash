import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ishare/utills/AppBar/button.dart';
import 'package:ishare/utills/ImagePicker/image_picker.dart';
import 'package:ishare/utills/Maps/map.dart';
import 'package:ishare/utills/Maps/pickup_location.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/colors.dart';
import 'package:ishare/utills/text_feild.dart';
import 'package:location/location.dart';

class AddItemDetailScreen extends StatefulWidget {
  final List files;
  AddItemDetailScreen({this.files});

  @override
  _AddItemDetailScreenState createState() =>
      _AddItemDetailScreenState(imageFiles: files);
}

class _AddItemDetailScreenState extends State<AddItemDetailScreen> {
  List imageFiles;
  _AddItemDetailScreenState({this.imageFiles});
  ChooseImage _chooseImage = ChooseImage();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _pickupTimeController = TextEditingController();
  String _listFor = "1 day";
  String _makeLive = "Now";
  String _showtoUser = "Immediately";

  bool value = false;

  final Location location = Location();
  LatLng _currentLocation;

  bool _loading = false;

  Future<void> _getLocation() async {
    setState(() {
      _loading = true;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _currentLocation =
            LatLng(_locationResult.latitude, _locationResult.longitude);
        _loading = false;
      });
    } on PlatformException catch (error) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: AppBarButton(
            onTap: () {
              Navigator.pop(context);
            },
            icon: CupertinoIcons.arrow_left),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter)
                .gradeintColors,
          ),
        ),
        title: Text(
          "Add Items",
          style: TextStyle(fontSize: 24),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          //Image Selection
          Container(
              height: 150,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
              decoration: _boxDecoration(),
              child: Container(
                width: _query.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    //physics: BouncingScrollPhysics(),
                    itemCount: (null != imageFiles) ? imageFiles.length + 1 : 1,
                    itemBuilder: (_, index) {
                      return (((null != imageFiles) ? imageFiles.length : 0) !=
                              index)
                          ? Container(
                              //alignment: Alignment.centerLeft,
                              width: _query.width * 0.4,
                              height: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: FileImage(imageFiles[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black45,
                                          Colors.transparent,
                                          Colors.transparent
                                        ])),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      customBorder: CircleBorder(),
                                      onTap: () {
                                        setState(() {
                                          imageFiles.removeAt(index);
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          CupertinoIcons.clear_circled,
                                          color: AppColors().white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              //alignment: Alignment.centerLeft,
                              width: _query.width * 0.4,
                              height: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {});
                                  _chooseSourcs(context);
                                },
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 60,
                                ),
                              ),
                            );
                    }),
              )),
          SizedBox(
            height: _query.height * 0.025,
          ),
          Container(
            decoration: _boxDecoration(),
            child: SwitchListTile(
              title: Text("Request for this"),
              activeColor: AppColors().liteColorWithOpacity(1),
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),
          ),
          SizedBox(
            height: _query.height * 0.025,
          ),
          Container(
            decoration: _boxDecoration(),
            child: Column(
              children: [
                AppTextFeild(
                  keyboardType: TextInputType.text,
                  controller: _titleController,
                  hintText: 'e.g Chicken Biryani, Shoes, Watch ',
                  labelText: 'Title',
                ),
                AppTextFeild(
                  keyboardType: TextInputType.text,
                  controller: _descriptionController,
                  hintText: 'e.g 2x Plate Biryani',
                  labelText: 'Description',
                ),
                AppTextFeild(
                  keyboardType: TextInputType.number,
                  controller: _quantityController,
                  hintText: 'e.g 4, 2, 1',
                  labelText: 'Quantity',
                ),
                AppTextFeild(
                  keyboardType: TextInputType.text,
                  controller: _pickupTimeController,
                  hintText: 'e.g today from 4-6pm or i can leave it outside',
                  labelText: 'Pick up times',
                ),
              ],
            ),
          ),
          SizedBox(
            height: _query.height * 0.025,
          ),
          InkWell(
            onTap: () {
              Get.to(() => PickupLocation());
            },
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              decoration: _boxDecoration(),
              child: Column(
                children: [
                  _customRow(title: "Your Location (approx)", subtitle: ""),
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
          SizedBox(
            height: _query.height * 0.025,
          ),
          InkWell(
            onTap: () {
              _showDialog(context,
                  title: "List for",
                  hintText: "e.g 1 hour, 1 day, 5 days",
                  text: _listFor,
                  flag: 0);
            },
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
              decoration: _boxDecoration(),
              child: Column(
                children: [
                  _customRow(title: "List For", subtitle: _listFor),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Text(
                        "Food with a 'Use By' date must be unlisted by midnoght date."),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: _query.height * 0.025,
          ),
          InkWell(
            onTap: () {
              _showDialog(context,
                  title: "Show to all users",
                  hintText: "e.g 1 hour, 2 hour(max 5days)",
                  text: _showtoUser,
                  flag: 1);
            },
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 16.0),
                decoration: _boxDecoration(),
                child: _customRow(
                    title: "Show to all users", subtitle: _showtoUser)),
          ),
          SizedBox(
            height: _query.height * 0.025,
          ),
          InkWell(
            onTap: () {
              _showDialog(context,
                  title: "Make Live in",
                  hintText: "e.g 5 mins,  15 mins (max 60)",
                  text: _makeLive,
                  flag: 2);
            },
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 16.0),
                decoration: _boxDecoration(),
                child: _customRow(title: "Make lives in", subtitle: _makeLive)),
          ),
          SizedBox(
            height: _query.height * 0.025,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppButton(
              onTap: () => print(""),
              name: "Submit",
            ),
          ),
          SizedBox(
            height: _query.height * 0.025,
          ),
        ],
      ),
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

  _customRow({String title, String subtitle}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Text(
          subtitle,
          style: TextStyle(color: AppColors(context: context).iconColor),
        ),
        SizedBox(
          width: 16.0,
        ),
        Icon(
          CupertinoIcons.right_chevron,
          color: AppColors(context: context).iconColor,
          size: 22.0,
        )
      ],
    );
  }

  void _showDialog(BuildContext context,
      {String title, String text, String hintText, int flag}) {
    TextEditingController controller = TextEditingController();
    controller.text = text;
    showDialog(
      barrierLabel: "App",
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(title),
              Spacer(),
              TextButton(
                child: Text(
                  "Okay",
                  style: TextStyle(color: AppColors().black),
                ),
                onPressed: () {
                  setState(() {
                    if (flag == 0)
                      _listFor = controller.text;
                    else if (flag == 1)
                      _showtoUser = controller.text;
                    else if (flag == 2) _makeLive = controller.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: AppTextFeild(
            controller: controller,
            keyboardType: TextInputType.text,
            labelText: "Type here...",
            hintText: hintText,
          ),
        );
      },
    );
  }

  void _chooseSourcs(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              "Add Photo",
            ),
            titlePadding: EdgeInsets.only(left: 20, top: 20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Camera"),
                  leading: Icon(CupertinoIcons.camera),
                  onTap: () {
                    _chooseImage.openCamera();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Gallery"),
                  leading: Icon(CupertinoIcons.photo_fill),
                  onTap: () {
                    _chooseImage.openFileExplore();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            contentPadding: EdgeInsets.only(bottom: 10.0),
          );
        });
  }
}
