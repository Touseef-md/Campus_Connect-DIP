import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vendor_provider.dart';
import '../widgets/vendors/order_widget.dart';
import '../widgets/vendors/actionBar_widget.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});
  static const routeName = '/vendor';
  @override
  Widget build(BuildContext context) {
    final vendorOrders = Provider.of<VendorOrders>(
      context,
    );
    final orders = vendorOrders.getOrders;
    final optionsKey = GlobalKey();
    final appbar = AppBar(
      foregroundColor: Colors.black,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Outlet Online',
            style: TextStyle(
              color: Colors.green,
              fontSize: 15,
            ),
          ),
          Text(
            'Accepting Orders',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    final mainContainerHeight =
        MediaQuery.of(context).size.height - appbar.preferredSize.height;
    return Scaffold(
      // persistentFooterButtons: [Icon(Icons.menu_book), Icon(Icons.more_horiz)],
      extendBodyBehindAppBar: true,
      appBar: appbar,
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        margin: EdgeInsets.fromLTRB(
          0,
          100,
          0,
          0,
        ),
        height: mainContainerHeight,
        child: Column(
          children: [
            Options(
              key: optionsKey,
            ),
            Container(
              height: 650,
              child: ListView.builder(
                padding: EdgeInsets.all(
                  0,
                ),
                itemBuilder: (context, index) {
                  return VendorOrder(
                    item: orders[index],
                  );
                },
                itemCount: orders.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
