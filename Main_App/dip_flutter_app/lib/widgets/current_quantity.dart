import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CurrentQuantity extends StatefulWidget {
  int quantity = 1;
  final double width;
  final double height;
  final bool changeState;
  final String productId;
  final double price;
  final String title;
  // final int quantity;
  CurrentQuantity({
    Key? key,
    this.changeState = false,
    this.quantity = 1,
    this.width = 110,
    this.height = 50,
    this.productId = '',
    this.price = 0,
    this.title = '',
  }) : super(key: key);

  int get getQuantity {
    return quantity;
  }

  @override
  State<CurrentQuantity> createState() => _CurrentQuantityState();
}

class _CurrentQuantityState extends State<CurrentQuantity> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(
      context,
    );
    return Container(
      // color: Colors.amber,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        // color: Colors.orange,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          11,
        ),
      ),
      alignment: Alignment.center,
      width: widget.width, height: widget.height,
      // height: widget.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widget.width / 3,
            child: IconButton(
              iconSize: widget.width / 5,
              // alignment: Alignment.centerLeft,
              // alignment: Alignment.centerLeft,
              // splashRadius: 1,
              icon: Icon(
                Icons.add,
                // size: widget.width / 4,
              ),
              alignment: Alignment.center,
              // child: Icon(
              //   Icons.add,
              //   // size: widget.width / 4,
              // ),
              style: TextButton.styleFrom(
                  // backgroundColor: Colors.red,
                  ),
              onPressed: () {
                setState(() {
                  widget.quantity++;
                  if (widget.changeState) {
                    cart.addItem(widget.productId, widget.price, widget.title,
                        1);
                  }
                });
              },
              // child: Text('+'),
            ),
          ),
          // SizedBox(width: widget.width / 10),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
                // textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.fade,
                widget.quantity.toString(),
                style: TextStyle(
                  // backgroundColor: Colors.red,
                  fontSize: 16,
                )
                // style: TextStyle(
                //   fontSize: 8,
                //   backgroundColor: Colors.grey,
                // ),
                ),
          ),
          SizedBox(
            width: widget.width / 3,
            child: IconButton(
              iconSize: widget.width / 5, alignment: Alignment.center,
              // alignment: Alignment.center,
              // sp lashRadius: 1,
              icon: Icon(
                Icons.remove,
                // size: widget.width / 4,
              ),
              // style: TextButton.styleFrom(
              //     // backgroundColor: Colors.red,
              //     ),

              onPressed: () {
                setState(
                  () {
                    if (widget.quantity > 1) {
                      widget.quantity--;
                    }
                    if (widget.changeState) {
                      cart.removeItem(
                        widget.productId,
                      );
                    }
                  },
                );
              },
              // child: Text('-'),
            ),
          ),
        ],
      ),
    );
  }
}
