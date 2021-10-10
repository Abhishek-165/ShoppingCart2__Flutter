import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/providers/cart.dart';
import 'package:shopping_cart/models/product_item.dart';

class AddToCart extends StatefulWidget {
  final ProductItem product;
  AddToCart({this.product});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isInCart = false;
  @override
  void didChangeDependencies() {
    var prodRef = Provider.of<Cart>(context, listen: false);
    if (prodRef.findById(widget.product) == -1) {
      isInCart = false;
    } else {
      isInCart = true;
    }
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var cartRef = Provider.of<Cart>(context);
    return ElevatedButton(
      onPressed: () {
        if (cartRef.findById(widget.product) == -1) {
          cartRef.addToCart(widget.product);
        } else {
          cartRef.removeItemCart(widget.product);
        }
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
