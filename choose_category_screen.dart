import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/add_item_details.dart';
import 'package:ishare/utills/AppBar/button.dart';
import 'package:ishare/utills/choose_category.dart';
import 'package:ishare/utills/colors.dart';

class ChooseCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Choose Category",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ChooseCategory(
            onTap: () {
              Get.off(AddItemDetailScreen());
            },
            name: "Food",
            description: "Give away anything you would eat yourself",
            image: "food.jpg",
          ),
          ChooseCategory(
            onTap: () {},
            name: "Book",
            description: "Give away anything you would read yourself",
            image: "book.jpg",
          ),
          ChooseCategory(
            onTap: () {},
            name: "Food",
            description: "Give away anything you would eat yourself",
            image: "medicines.jpeg",
          ),
          ChooseCategory(
            onTap: () {},
            name: "Cloths",
            description: "Give away anything you would wear yourself",
            image: "cloths.jpeg",
          ),
          ChooseCategory(
            onTap: () {},
            name: "Home Appliances",
            description: "Give away anything you want",
            image: "home appliances.jpeg",
          ),
          ChooseCategory(
            onTap: () {},
            name: "Men Accessories",
            description: "Give away anything you use",
            image: "men accessories.jpeg",
          ),
          ChooseCategory(
            onTap: () {},
            name: "Women Accessories",
            description: "Give away anything you use",
            image: "women accessories.jpeg",
          )
        ],
      ),
    );
  }
}
