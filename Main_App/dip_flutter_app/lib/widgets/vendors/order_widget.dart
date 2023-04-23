import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

import '../../providers/order_provider.dart';

class VendorOrder extends StatelessWidget {
  final OrderItem item;
  const VendorOrder({
    super.key,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      margin: EdgeInsets.fromLTRB(
        15,
        0,
        15,
        10,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  '${item.orderId}',
                  // style: Theme.of(context).textTheme.headline5,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          Theme.of(context).textTheme.headline5!.fontSize),
                ),
              ),
              SizedBox(
                child: Text(
                  '|',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  '${DateFormat('hh:mm a').format(item.time)}',
                  // style: Theme.of(context).textTheme.headline5,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
            // color: Colors.grey,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              // vertical: 5,
            ),
            height: item.cart.length * 25,
            // height: 200,
            // color: Colors.amber,
            child: ListView.builder(
              padding: EdgeInsets.all(
                0,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // print('${item.cart[index].title} This is the thing');
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   'dsfsdf',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //   ),
                      // )
                      Text(
                        '${item.cart[index].quantity} x ${item.cart[index].title}',
                        style: TextStyle(
                          color: Colors.black,
                          // backgroundColor: Colors.red,
                        ),
                      ),
                      Text(
                        '₹${item.cart[index].price * item.cart[index].quantity}',
                        // style: Theme.of(context).textTheme.headline6,
                      ),
                      // Icon(
                      //   Icons.add,
                      //   color: Colors.black,
                      // )
                    ],
                  ),
                );
              },
              itemCount: item.cart.length,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text('Total bill : ₹${item.amount}',
                style: TextStyle(
                  color: Colors.grey,
                )),
          ),
          Container(
            height: 50,
            width: 300,
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              onPressed: () {
                
              },
              child: Text(
                'Order Ready',
              ),
            ),
          )
        ],
      ),
    );
  }
}
