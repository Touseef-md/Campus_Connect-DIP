import 'package:flutter/material.dart';

class ProfileWidget2 extends StatelessWidget {
  const ProfileWidget2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 110,
            width: 124,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite_outline),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Likes',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 110,
            width: 124,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.payment,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Payment',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 110,
            width: 124,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.settings,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Settings',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
