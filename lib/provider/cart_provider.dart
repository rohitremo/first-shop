import 'package:flutter/material.dart';

import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItem = {};

  Map<String, Cart> get items {
    return {..._cartItem};
  }

  void addItem(String productId, String title, double price) {
    if (_cartItem.containsKey(productId)) {
      _cartItem.update(
        productId,
        (existingCartItem) => Cart(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _cartItem.putIfAbsent(
        productId,
        () => Cart(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _cartItem.forEach((key, cItem) {
      total += cItem.price * cItem.quantity;
    });
    return total;
  }
}
