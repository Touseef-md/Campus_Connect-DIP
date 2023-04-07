import 'package:flutter/material.dart';

import './cart_provider.dart';

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

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List get getOrders {
    // print('get orders ${_orders[0]}');
    return _orders;
  }

  void addOrder(double amount, List<CartItem> currCart) {
    _orders.insert(
      0,
      OrderItem(
        orderId: DateTime.now().millisecond.toString(),
        time: DateTime.now(),
        amount: amount,
        cart: currCart,
      ),
    );
    notifyListeners();
  }
}
