import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final title;
  final routeName;
  final icon;
  const DrawerTile({
    super.key,
    this.title,
    this.routeName,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      style: ListTileStyle.list,
    );
  }
}
