import 'package:flutter/material.dart';
import '../modals/user_data.dart';

class ProfileWidget1 extends StatelessWidget {
  const ProfileWidget1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 10,
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headline4,
                    // softWrap: false,
                  ),
                  Text(
                    user.emailId,
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
              CircleAvatar(
                foregroundImage: NetworkImage(user.imageUrl),
                backgroundImage: const NetworkImage(
                    'https://e1.pxfuel.com/desktop-wallpaper/522/391/desktop-wallpaper-look-children-face-background-black-and-white-mood-profile-section-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%B8%D1%8F-black-and-white-face.jpg'),
                minRadius: 20,
                maxRadius: 45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
