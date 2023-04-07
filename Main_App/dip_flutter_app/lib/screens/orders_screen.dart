import 'package:dip_flutter_app/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item_widget.dart';
import '../providers/order_provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    double parentHeight = MediaQuery.of(context).size.height * 0.8;
    final orders = Provider.of<Orders>(
      context,
      // listen: false,
    ).getOrders as List<OrderItem>;
    // print('These are the orders ${orders[0].orderId}');
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Your Orders',
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.red,
          gradient: LinearGradient(
            colors: [
              Color(
                0xFF20124d,
              ),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.3,
              0.7,
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // alignment: Alignment.center,
            height: parentHeight,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 25,
                  offset: Offset(
                    0,
                    -1,
                  ),
                ),
              ],
            ),
            // height: MediaQuery.of(context).size.height * 0.5,
            // width: MediaQuery.of(context).size.width * 0.5,
            // margin: EdgeInsets.symmetric(
            //   horizontal: 20,
            //   vertical: 150,
            // ),
            // color: Colors.white,
            child:
                // Text(
                //   'fdsfsdf',
                //   style: TextStyle(
                //     color: Colors.black,
                //   ),
                // )
                Column(
              children: [
                Container(
                  margin: EdgeInsets.all(
                    10,
                  ),
                  height: 50,
                  width: 300,
                  alignment: Alignment.center,
                  color: Colors.deepOrange,
                  child: Text(
                    'Deliveries',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white, fontSize: 35),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: parentHeight - 70,
                    child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(
                        0,
                      ),
                      itemBuilder: (ctx, index) {
                        return Order(
                          orderId: orders[index].orderId,
                          time: orders[index].time,
                          amount: orders[index].amount,
                        );
                      },
                      itemCount: orders.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
