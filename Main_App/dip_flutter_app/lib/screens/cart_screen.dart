import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/divider_text.dart';
import '../widgets/veg_icon.dart';
import '../widgets/current_quantity.dart';
import '../providers/cart_provider.dart';
import '../providers/order_provider.dart';
import '../screens/orders_screen.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  static const routeName = '/cart';
  GlobalKey vegIconKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(
      context,
      // listen: false,
    );
    final order = Provider.of<Orders>(
      context,
      listen: false,
    );
    // final order=Provid``
    final _items = cart.getItemsWithKeys;
    final _itemKeys = _items.keys.toList();
    final _itemValues = _items.values.toList();
    List cartItems;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DividerText(
              label: 'ITEM(S) ADDED',
            ),
            Container(
              alignment: Alignment.center,
              height: _items.length * 90,
              color: Colors.grey,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              VegIcon(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _itemValues[index].title,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    ' ₹${_itemValues[index].price.toString()}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CurrentQuantity(
                                quantity:
                                    _itemValues[index].quantity,
                                width: 85,
                                changeState: true,
                                price: _itemValues[index].price,
                                productId: _items.keys.toList()[index],
                                title: _itemValues[index].title,
                                height: 35,
                                // width: 70,
                              ),
                              Text(
                                '₹${(_itemValues[index].quantity * _itemValues[index].price).toString()}',
                                style: Theme.of(context).textTheme.headline5,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _items.length,
              ),
            ),
            DividerText(
              label: 'BILL SUMMARY',
            ),
            Card(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      '₹${cart.getTotalAmount}',
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                )
              ]),
            ),
            ElevatedButton(
              onPressed: () {
                order.addOrder(
                  cart.getTotalAmount,
                  cart.getItems,
                );
                Navigator.pushNamed(context, OrdersScreen.routeName);
              },
              child: Text(
                'Place Order',
              ),
            )
          ],
        ),
      ),
    );
  }
}
