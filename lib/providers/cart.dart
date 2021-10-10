import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product_item.dart';

class Cart with ChangeNotifier {
  List<ProductItem> _item = [];

  List<ProductItem> get item {
    return [..._item];
  }

  void clearCart() {
    _item.clear();
    notifyListeners();
  }

  num get totalPrice => item.fold(0, (total, current) => total + current.price);

  int findById(ProductItem product) {
    return _item.indexWhere((element) => element.id == product.id);
  }

  void addToCart(ProductItem productItem) {
    _item.add(productItem);
    notifyListeners();
  }

  void removeItemCart(ProductItem productItem) {
    _item.remove(productItem);
    notifyListeners();
  }
}
