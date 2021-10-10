import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/product_item.dart';
import 'package:shopping_cart/pages/catalogue_item.dart';
import 'package:shopping_cart/pages/home_detail_page.dart';
import 'package:shopping_cart/providers/cart.dart';
import 'package:shopping_cart/providers/product.dart';
import 'package:shopping_cart/widgets/catalogue_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  bool _init = true;

  void didChangeDependencies() {
    if (_init) {
      Provider.of<Product>(context, listen: false).getProducts();
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context);
    return Scaffold(
      floatingActionButton: Container(
        child: FittedBox(
          child: Stack(alignment: Alignment(1.4, -1.5), children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cart');
              },
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
            ),
            Consumer<Cart>(
              builder: (context, cart, _) => Container(
                child: Center(
                  child: Text(cart.item.length.toString(),
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold)),
                ),
                padding: EdgeInsets.all(5),
                constraints: BoxConstraints(minHeight: 28, minWidth: 28),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: Colors.black.withAlpha(50))
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFE4E4E7)),
              ),
            ),
          ]),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogueHeader(),
                product.items != null && product.items.isNotEmpty
                    ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: product.items.length,
                        itemBuilder: (context, i) {
                          var productItem = product.items[i];

                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HomeDetailPage(product: productItem),
                                  ),
                                );
                              },
                              child: CatalogueItem(product: productItem));
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
