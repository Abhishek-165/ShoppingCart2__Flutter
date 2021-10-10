import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/cart.dart';
import 'package:shopping_cart/pages/home_page.dart';
import 'package:shopping_cart/pages/login.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
    '/':(ctx)=>LoginPage(),
    'home':(ctx)=>HomePage(),
    'cart':(ctx)=>CartPage()
    };
  }
}