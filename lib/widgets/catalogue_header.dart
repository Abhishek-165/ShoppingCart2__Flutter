import 'package:flutter/material.dart';

class CatalogueHeader extends StatelessWidget {
  const CatalogueHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
              fontSize: 36,
              color: Theme.of(context).buttonColor,
              fontWeight: FontWeight.bold),
        ),
        Text("Trending products", style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
