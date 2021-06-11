import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishare/screens/item_detail_screen.dart';
import 'package:ishare/utills/category_card.dart';
import 'package:ishare/utills/colors.dart';
import 'package:ishare/utills/item_card.dart';

class CustomeWidgetHome extends StatefulWidget {
  @override
  _CustomeWidgetHomeState createState() => _CustomeWidgetHomeState();
}

class _CustomeWidgetHomeState extends State<CustomeWidgetHome> {
  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: _query.size.height,
        child: Column(
          children: [
            SizedBox(
              height: _query.size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 30.0),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                              color: AppColors().liteColorWithOpacity(1.0)),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: _query.size.height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Category(
                    src: 'assets/images/book.jpg', onTap: () {}, name: 'Books'),
                SizedBox(
                  width: _query.size.width * 0.01,
                ),
                Category(
                    src: 'assets/images/food.jpg', onTap: () {}, name: 'Food'),
                SizedBox(
                  width: _query.size.width * 0.01,
                ),
                Category(
                    src: 'assets/images/medicines.jpeg',
                    onTap: () {},
                    name: 'Medicines'),
                SizedBox(
                  width: _query.size.width * 0.01,
                ),
                Category(
                    src: 'assets/images/cloths.jpeg',
                    onTap: () {},
                    name: 'Clothes'),
                SizedBox(
                  width: _query.size.width * 0.01,
                ),
                Category(
                    src: 'assets/images/home appliances.jpeg',
                    onTap: () {},
                    name: 'Home Appliances'),
                SizedBox(
                  width: _query.size.width * 0.01,
                ),
                Category(
                    src: 'assets/images/men accessories.jpeg',
                    onTap: () {},
                    name: 'Men Accessories'),
                SizedBox(
                  width: _query.size.width * 0.01,
                ),
                Category(
                    src: 'assets/images/women accessories.jpeg',
                    onTap: () {},
                    name: 'Women Accessories'),
              ]),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                //shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ItemCard(
                    onTap: () {Get.to(()=>ItemDetailScreen());},
                    itemImage:
                        "https://sc04.alicdn.com/kf/UTB8MzwKXrnJXKJkSahGq6xhzFXaN.jpg",
                    itemName: "Item Name $index",
                    userImage:
                        "https://pbs.twimg.com/profile_images/953645977478582272/6ag3Xx5F_400x400.jpg",
                    userName: "User $index",
                    likes: "${100 * index}k",
                    rating: "${index % 5}",
                    distance: "${index + 1 * 1000}km",
                    views: "${index + 1 * 10}",
                    width: 0.8,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
