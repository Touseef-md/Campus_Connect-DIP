import 'package:flutter/material.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/categories.dart';
import '../widgets/app_drawer.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
