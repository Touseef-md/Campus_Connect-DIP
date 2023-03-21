import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../modals/carousel_data.dart';
class Carousel_Slider extends StatelessWidget {
  const Carousel_Slider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index, realIndex) {
        return Container(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(
            //     20,
            //   ),
            // ),
            // color: Colors.amber,
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(items[index].imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: Colors.red,
              // border: Border.all(
              //   color: Colors.red,
              // ),
            )
            // width: double.infinity,
            // alignment: Alignment.center,
            // height: 200,
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(
            //     20,
            //   ),
            //   child: Image.network(
            //     items[index].imageUrl,
            //     // height: 250,
            //     // width: double.infinity,
            //     fit: BoxFit.cover,
            //     // alignment: Alignment.center,
            //   ),
            // ),
            );
      },
      options: CarouselOptions(
        // aspectRatio: 5 / 3,
        autoPlay: true,
        // height: 250,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        disableCenter: false,
        enlargeFactor: 0.3,
      ),
    );
  }
}
