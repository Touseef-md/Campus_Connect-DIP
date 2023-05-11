import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import './cart_provider.dart';

final urlAddOrder = Uri.parse("http://192.168.90.233:3000/place-order");
final urlFetchOrder = Uri.parse("http://192.168.90.233:3000/");

class OrderItem {
  final String orderId;
  final DateTime time;
  final double amount;
  final List<CartItem> cart;
  OrderItem({
    required this.orderId,
    required this.time,
    required this.amount,
    required this.cart,
  });
}

// var vendor=Provider.of(context)
class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  Orders(this._orders);
  List get getOrders {
    // print('get orders ${_orders[0]}');
    return _orders;
  }

  Future<void> fetchAndSet({
    required userId,
  }) async {
    try {
      print('Inside try block, User id is ${userId}');
      final response = await http.post(
        urlFetchOrder,
        body: json.encode({
          'userId': userId,
        }),
        headers: {
          'content-type': 'application/json',
        },
      );
      final orders = json.decode(response.body)[0]['order'];
      // print(orders.runtimeType);
      // orders
      // _orders = orders;
      // print('THis is the list');
      // print(orders);
      var oldOrder;
      List<CartItem> oldCartItem = [];
      for (int i = 0; i < orders.length; i++) {
        oldCartItem = [];
        for (int j = 0; j < orders[i]['cart'].length; j++) {
          oldCartItem.add(CartItem(
              id: orders[i]['cart'][j]['id'],
              price: orders[i]['cart'][j]['price'].toDouble(),
              quantity: orders[i]['cart'][j]['quantity'],
              title: orders[i]['cart'][j]['title']));
        }
        // print('Overwriting is done ');
        // oldCartIte
        // print(oldCartItem);
        oldOrder = OrderItem(
          orderId: orders[i]['orderId'],
          time: DateTime.parse(orders[i]['dateTime']),
          amount: orders[i]['amount'].toDouble(),
          cart: oldCartItem,
        );
        _orders.add(oldOrder);
        // print(orders[i]);
      }
      // print('Our orders ${_orders}');
      // print('Respnse for fetch and set is');
      // print();
    } catch (err) {
      print('Error while fetching the orders in frontend');
      print(err);
    }
    notifyListeners();
    // return;
  }

  Future<void> addOrder(
      double amount, List<CartItem> currCart, String authToken) async {
    // final url=Uri.parse('')
    final timestamp = DateTime.now();
    var item = OrderItem(
      orderId: timestamp.millisecond.toString(),
      time: timestamp,
      amount: amount,
      cart: currCart,
    );

    // print(json.encode({
    //   // 'cartitems': currCart
    //   //     .map(
    //   //       (e) => {
    //   //         'title': e.title,
    //   //         'quantity': e.quantity,
    //   //         'price': e.price,
    //   //         'id': e.id,
    //   //       },
    //   //     )
    //   //     .toList(),
    //   'amount': amount,
    //   'dateTime': timestamp.toIso8601String(),
    // }));
    try {
      final response = await http.post(
        urlAddOrder,
        body: json.encode(
          {
            'userId': authToken,
            'cartitems': currCart
                .map(
                  (e) => {
                    'title': e.title,
                    'quantity': e.quantity,
                    'price': e.price,
                    'id': e.id,
                  },
                )
                .toList(),
            'amount': amount,
            'dateTime': timestamp.toIso8601String(),
          },
        ),
        headers: {
          'content-type': 'application/json',
        },
      );
      print(response.body);
    } catch (error) {
      print(error);
    }
    // print('THis is the response');
    // print(response.statusCode);
    // if (response.statusCode >= 400) {
    //   print("Error is :");
    //   // throw;
    // }
    // final url=Uri.parse("")

    _orders.insert(
      0,
      item,
    );
    notifyListeners();
  }
}
