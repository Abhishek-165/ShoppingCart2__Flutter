import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:shopping_cart/models/product_item.dart';

class Product with ChangeNotifier {
  List<ProductItem> _items = [];

  List<ProductItem> get items {
    return [..._items];
  }



  Future<void> getProducts() async {
    var url = 'https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3';
    var response = await https.get(Uri.parse(url));
    var extractedData = json.decode(response.body) as Map<String, dynamic>;
    List<ProductItem> _temp = [];

    for (int i = 0; i < extractedData['products'].length; i++) {
      _temp.insert(
          i,
          ProductItem(
              id: extractedData['products'][i]['id'],
              name: extractedData['products'][i]['name'],
              desc: extractedData['products'][i]['desc'],
              price: extractedData['products'][i]['price'],
              image: extractedData['products'][i]['image']));
    }
    _items = _temp;
    notifyListeners();
  }
}
