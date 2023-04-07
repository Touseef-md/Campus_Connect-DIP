import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/categories.dart';
import '../widgets/app_drawer.dart';
import '../widgets/meals_widget.dart';
import '../widgets/badge.dart';
import '../providers/cart_provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [
          Badge(
            color: Colors.pink,
          )
          // Badge(value: '1'),
        ],
        title: Text("6 Shils"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Carousel_Slider(),
            // Text(
            //   "Browse Services",
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Text(
              "Browse by Categories",
              style: Theme.of(context).textTheme.headline4,
            ),
            Category(),
            const Meal(),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
