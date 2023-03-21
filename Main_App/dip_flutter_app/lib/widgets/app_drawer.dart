import 'package:dip_flutter_app/screens/feedback_screen.dart';
import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../screens/faq_screen.dart';
import '../screens/health_screen.dart';
import './app_drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final heightFactor = 0.37;
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * heightFactor,
            color: Colors.amber,
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * (1 - heightFactor),
              child: ListView(
                children: const [
                  DrawerTile(
                    icon: Icons.account_circle,
                    routeName: ProfileScreen.routeName,
                    title: 'Profile',
                  ),
                  DrawerTile(
                    icon: Icons.feedback,
                    routeName: FeedbackScreen.routeName,
                    title: 'Feedback',
                  ),
                  DrawerTile(
                    icon: Icons.health_and_safety,
                    routeName: HealthScreen.routeName,
                    title: 'Health',
                  ),
                  DrawerTile(
                    title: 'FAQs',
                    icon: Icons.question_mark,
                    routeName: FAQScreen.routeName,
                  )
                  // ListTile(
                  //   leading: Icon(Icons.account_circle),
                  //   title: Text(
                  //     'Profile',
                  //   ),
                  //   onTap: () {
                  //     Navigator.pushNamed(
                  //       context,
                  //       ProfileScreen.routeName,
                  //     );
                  //   },
                  //   style: ListTileStyle.list,
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.feedback),
                  //   title: Text(
                  //     'Feedback',
                  //   ),
                  //   onTap: () {
                  //     Navigator.pushNamed(
                  //       context,
                  //       FeedbackScreen.routeName,
                  //     );
                  //   },
                  //   style: ListTileStyle.list,
                  // ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.health_and_safety,
                  //   ),
                  //   title: Text(
                  //     'Health',
                  //   ),
                  //   onTap: () {},
                  //   style: ListTileStyle.list,
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
