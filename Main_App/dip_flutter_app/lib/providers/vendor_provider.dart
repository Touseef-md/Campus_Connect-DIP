import 'package:dip_flutter_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';
import './cart_provider.dart';
import './order_provider.dart';
// class OrderItem {
//   final String orderId;
//   final DateTime time;
//   final double amount;
//   final List<CartItem> cart;
//   OrderItem({
//     required this.orderId,
//     required this.time,
//     required this.amount,
//     required this.cart,
//   });
// }

final urlFetchOrderesVendor = Uri.parse('http://172.18.0.51:3000/get-orders');

class VendorOrders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List get getOrders {
    return _orders;
  }

  void addOrder(
    OrderItem item,
  ) {
    _orders.insert(0, item);
    notifyListeners();
  }

  Future<void> fetchOrders() async {
    // print('Function called');
    Timer.periodic(
      Duration(
        seconds: 5,
      ),
      (timer) async {
        // print('Timer called');
        // print('IP is ${dotenv.env['SERVER_IP']}');
        // final url = Uri.parse(dotenv.env['SERVER_IP'] ?? 'Nothing');
        // print('url is $url');
        final response = await http.get(urlFetchOrderesVendor);

        print('This is the response of vendor\n${response.body}');
        // print(response.body);
      },
    );
  }

  Future<void> orderReady(OrderItem item) async{
    
  }
}
