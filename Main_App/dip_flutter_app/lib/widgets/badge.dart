import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';
import '../providers/cart_provider.dart';

class Badge extends StatelessWidget {
  // final Widget child;
  // final String value;
  final Color color;

  Badge({
    super.key,
    // required this.child,
    // required this.value,
    this.color = Colors.pink,
  });

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<Cart>(
      context,
      // listen: false,
    ).getItemCount;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CartScreen.routeName,
        );
      },
      child: SizedBox(width: 45,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.add_shopping_cart,
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: EdgeInsets.all(2.0),
                // color: Theme.of(context).accentColor,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: color != null ? color : color,
                ),
                constraints: BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                ),
                child: Text(
                  count.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
