import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product_item.dart';
import 'package:shopping_cart/widgets/add_to_cart.dart';

class CatalogueItem extends StatelessWidget {
  final ProductItem product;
  const CatalogueItem({this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Hero(
                    tag: Key(product.id.toString()),
                    child: Image.network(
                      product.image,
                      width: 80,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(product.desc),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      AddToCart(product: product)
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
