import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  String orderId;
  DateTime time;
  double amount;
  Order({
    super.key,
    required this.orderId,
    required this.time,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      height: 100,
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Id :${orderId}',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text('Time: ${time}'),
          Text(
            'Total : ₹ ${amount}',
            style: Theme.of(context).textTheme.headline5,
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
