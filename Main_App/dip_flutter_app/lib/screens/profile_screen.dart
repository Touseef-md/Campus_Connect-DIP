import 'package:flutter/material.dart';
import '../widgets/profile_widget_1.dart';
import '../widgets/profile_widget_2.dart';
import '../widgets/profile_widget_3.dart';
import '../modals/user_data.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: Text(
            'Profile',
          ),
        ),
        body: Column(
          children: [
            ProfileWidget1(),
            ProfileWidget2(),
            ProfileWidget3(),
          ],
        )
        // Column(
        //   children: [Card()],
        // ),
        );
  }
}
