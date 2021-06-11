import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isChecked;
  final double size;
  final double iconSize;
  final Color selectedColor;
  final Color selectedIconColor;

  CustomCheckbox(
      {this.isChecked,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: _isSelected
                ? widget.selectedColor ?? Colors.blue
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            border: _isSelected
                ? null
                : Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  )),
        width: widget.size ?? 30,
        height: widget.size ?? 30,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: widget.selectedIconColor ?? Colors.white,
                size: widget.iconSize ?? 20,
              )
            : null,
      ),
    );
  }
}

// SizedBox(
          //   width: 10,
          //   height: 60,
          // ),
          // CustomCheckbox(
          //   // iconSize: 10.0,
          //   // selectedColor: Colors.blue,
          //   // isChecked: false,
          //   size: 25.0,
          //   // selectedIconColor: Colors.black,
          // ),
          // Text(
          //   "checkString",
          //   style: TextStyle(fontSize: 20.0, color: Colors.blue),
          // ),
// class CustomCheckboxfull extends StatefulWidget {
  
//   final bool isChecked;
//   final double size;
//   final double iconSize;
//   final Color selectedColor;
//   final Color selectedIconColor;
//   // final String checkString;

//   CustomCheckboxfull(
//       {this.isChecked,
//       this.size,
//       this.iconSize,
//       this.selectedColor,
//       this.selectedIconColor});

//   @override
//   _CustomCheckboxState createState() => _CustomCheckboxState();
// }

// class _CustomCheckboxfullState extends State<CustomCheckboxfull> {
//   bool _isSelected = false;

//   @override
//   void initState() {
//     _isSelected = widget.isChecked ?? false;
//     super.initState();
//   }

// // checkString = "sdf";
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 10,
//           height: 60,
//         ),
//         CustomCheckbox(
//           // iconSize: 10.0,
//           // selectedColor: Colors.blue,
//           // isChecked: false,
//           size: 25.0,
//           // selectedIconColor: Colors.black,
//         ),
//         Text(
//           "checkString",
//           style: TextStyle(fontSize: 20.0, color: Colors.blue),
//         ),
//       ],
//     );
//   }
// }
