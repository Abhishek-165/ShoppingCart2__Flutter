import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/providers/cart.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  _buyProduct(price) {
    // var options = {
    //   'key': '',
    //   'amount': price * 100,
    //   'name': 'Abhishek Dixit',
    // };

    // _razorpay.open(options);

    Provider.of<Cart>(context, listen: false).clearCart();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Image.asset('assets/images/confirm.png', height: 50)),
            content: Text("Order Confirmed!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Okay"))
            ],
          );
        });
  }

  _addProductCart() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No Product in the Cart"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Okay"))
            ],
          );
        });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  @override
  Widget build(BuildContext context) {
    var cartRef = Provider.of<Cart>(context);
    return Scaffold(
        bottomSheet: Container(
          padding: EdgeInsets.all(8),
          child: ButtonBar(
            children: [
              Text(
                "\$ ${cartRef.totalPrice}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
              ),
              ElevatedButton(
                onPressed: () => cartRef.totalPrice != 0
                    ? _buyProduct(cartRef.totalPrice)
                    : _addProductCart(),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).buttonColor),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    )),
                child: Text("Buy"),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_outlined, color: Colors.black)),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: cartRef.item.length != 0
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: cartRef.item.length,
                  itemBuilder: (context, i) => ListTile(
                    title: Text(cartRef.item[i].name),
                    subtitle: Text(cartRef.item[i].desc),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "\$ ${cartRef.item[i].price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.black),
                          onPressed: () {
                            cartRef.removeItemCart(cartRef.item[i]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                "Nothing to Show",
                style: TextStyle(fontSize: 36),
              )));
  }
}
