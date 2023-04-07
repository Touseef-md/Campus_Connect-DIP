import 'package:flutter/material.dart';

class VegIcon extends StatelessWidget {
  final Color color;
  const VegIcon({
    super.key,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.crop_square_sharp,
          color: color,
        ),
        Positioned(
          top: 6.5,
          left: 6.5,
          child: Icon(
            Icons.circle,
            color: color,
            size: 11,
          ),
        )
      ],
    );
  }
}
