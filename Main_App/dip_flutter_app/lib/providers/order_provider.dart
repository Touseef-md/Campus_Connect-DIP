import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import './cart_provider.dart';

final urlAddOrder = Uri.parse("http://172.18.0.51:3000/place-order");

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

  List get getOrders {
    // print('get orders ${_orders[0]}');
    return _orders;
  }

  Future<void> addOrder(double amount, List<CartItem> currCart) async {
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
