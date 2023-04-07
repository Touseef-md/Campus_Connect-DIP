import 'package:flutter/material.dart';

class CartItem {
  String id;
  String title;
  int quantity;
  double price;
  CartItem({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  void addItem(String productId, double price, String title, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingvalue) => CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: existingvalue.quantity + quantity,
          title: title,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: quantity,
          title: title,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity--;
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  List<CartItem> get getItems {
    List<CartItem> item = [];
    _items.forEach(
      (key, value) {
        item.add(value);
      },
    );
    return item;
  }

  Map get getItemsWithKeys {
    return _items;
  }

  int get getItemCount {
    return _items.length;
  }

  double get getTotalAmount {
    double amount = 0;
    _items.forEach((prodId, cartItem) {
      amount += _items[prodId]!.price * _items[prodId]!.quantity;
    });
    return amount;
  }
}
