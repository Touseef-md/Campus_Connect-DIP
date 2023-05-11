import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';
import '../screens/login_screen.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileWidget3 extends StatelessWidget {
  const ProfileWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: [
          ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, OrdersScreen.routeName);
            },
            leading: const Icon(
              Icons.food_bank,
            ),
            title: const Text(
              'Your Orders',
            ),
            trailing: const Icon(
              Icons.arrow_forward,
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
            ),
            onTap: () {},
            leading: Icon(
              Icons.food_bank,
            ),
            title: Text(
              'About',
            ),
            trailing: Icon(
              Icons.arrow_forward,
            ),
          ),
          Divider(
            height: 0,
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
            ),
            onTap: () {
              final auth = Provider.of<Auth>(
                context,
                listen: false,
              );
              auth.logout();
              Navigator.pushNamed(
                context,
                LoginScreen.routeName,
              );
            },
            leading: Icon(
              Icons.food_bank,
            ),
            title: Text(
              'Logout',
            ),
            trailing: Icon(
              Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
