import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/meal_item.dart';
import '../widgets/badge.dart';
import '../widgets/current_quantity.dart';
import '../providers/cart_provider.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen({super.key});
  static const routeName = '/meal-detail';
  var quantityObject = CurrentQuantity();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );
    // final routeArgs =
    int quantity = 1;
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    // final List<String> imageUrls = routeArgs['imageUrls'] as List<String>;
    // print(routeArgs ?? 'title');
    // final String title = routeArgs['title'] as String;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Badge(
            color: Colors.pink,
          )
          // Badge(value: '1'),
        ],
        title: Text(
          'Food Item',
        ),
      ),
      body: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                15,
              ),
              child: Image.network(
                meal.imageUrls[0],
                fit: BoxFit.cover,
              ),
            ),
            Text(
              meal.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Description: ${meal.description}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  'Shopname: ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  meal.shopName,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Location: ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  meal.location,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Text(
              'Open/Close: ${meal.openTime.hour}/${meal.closeTime.hour}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      // persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        // CurrentQuantity().,
        quantityObject,
        // OutlinedButton(
        //   //  backgroundColor: Colors.amber,
        //   style: OutlinedButton.styleFrom(
        //     side: BorderSide(
        //       color: Colors.red,
        //     ),
        //     minimumSize: Size(
        //       100,
        //       50,
        //     ),
        //   ),

        //   onPressed: () {},
        //   child: Text(
        //     '- Add +',
        //     // style: Theme.of(context).textTheme.button,
        //   ),
        // ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(250, 50),
          ),
          onPressed: () {
            cart.addItem(
              meal.mealId,
              meal.price,
              meal.title,
              quantityObject.getQuantity,
            );
          },
          child: Text(
            'Add Item',
          ),
        )
      ],
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
    );
  }
}
