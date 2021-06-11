import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ishare/utills/button.dart';
import 'package:ishare/utills/colors.dart';

class Agreement extends StatefulWidget {
  const Agreement({Key key}) : super(key: key);

  @override
  _AgreementState createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  @override
  List<String> _doIt = [
    "Stay what time you can collect",
    "Message if you're running late",
    "Be respectful to all iShare users,\nespecially volunteer who are sharing lots"
  ];
  List<String> _doNot = [
    "Ask for items to be dilivered",
    "MGet upset if yoou don't get something",
    "Set off all Collection"
  ];
  List<bool> _doItActions = List.generate(4, (index) => false);
  List<bool> _doNotActions = List.generate(4, (index) => false);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter)
                .gradeintColors,
          ),
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              SizedBox(
                height: 30,
              ),
              IconButton(
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                    color: AppColors().white,
                    size: 35.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Center(
                  child: Text(
                "To request a listing",
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              )),
              Center(
                  child: Text(
                "Please check all boxes to continue\n",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              )),
              SizedBox(
                height: 10,
              ),
              _doFunction("Do", Icons.thumb_up),
              ComponenContainer(
                list: [
                  Component(
                    title: _doIt[0],
                    isSelected: _doItActions[0],
                    onTap: () {
                      setState(() {
                        _doItActions[0] = _doItActions[0] ? false : true;
                      });
                    },
                  ),
                  Component(
                    title: _doIt[1],
                    isSelected: _doItActions[1],
                    onTap: () {
                      setState(() {
                        _doItActions[1] = _doItActions[1] ? false : true;
                      });
                    },
                  ),
                  Component(
                    title: _doIt[2],
                    isSelected: _doItActions[2],
                    onTap: () {
                      setState(() {
                        _doItActions[2] = _doItActions[2] ? false : true;
                      });
                    },
                  ),
                ],
              ),
              _doFunction(" Do Not", Icons.thumb_down),
              ComponenContainer(
                list: [
                  Component(
                    title: _doNot[0],
                    isSelected: _doNotActions[0],
                    onTap: () {
                      setState(() {
                        _doNotActions[0] = _doNotActions[0] ? false : true;
                      });
                    },
                  ),
                  Component(
                    title: _doNot[1],
                    isSelected: _doNotActions[1],
                    onTap: () {
                      setState(() {
                        _doNotActions[1] = _doNotActions[1] ? false : true;
                      });
                    },
                  ),
                  Component(
                    title: _doNot[2],
                    isSelected: _doNotActions[2],
                    onTap: () {
                      setState(() {
                        _doNotActions[2] = _doNotActions[2] ? false : true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  "Please check all boxes to continue\n",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors().white,
                ),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "I agree",
                      style: TextStyle(
                          color: AppColors().liteColorWithOpacity(1),
                          fontSize: 20.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _doFunction(String s, IconData icon) {
    return Row(children: [
      SizedBox(
        width: 10,
      ),
      Icon(
        icon,
        color: Colors.yellow.shade700,
      ),
      Text(
        "  $s",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      SizedBox(
        height: 50,
      ),
    ]);
  }
}

class ComponenContainer extends StatelessWidget {
  final List<Widget> list;
  ComponenContainer({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        children: list,
      ),
    );
  }
}

class Component extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function onTap;
  const Component({Key key, this.isSelected, this.onTap, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? CupertinoIcons.checkmark_square_fill
                  : CupertinoIcons.square,
              color: AppColors().liteColorWithOpacity(1),
              size: 28,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.025,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
