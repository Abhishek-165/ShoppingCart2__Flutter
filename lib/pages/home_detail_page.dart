import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product_item.dart';
import 'package:shopping_cart/widgets/add_to_cart.dart';

class HomeDetailPage extends StatefulWidget {
  final ProductItem product;
  HomeDetailPage({this.product});

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(12),
          color: Theme.of(context).canvasColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              Text(
                "\$${widget.product.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              AddToCart(
                product: widget.product,
              )
            ],
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                  clipper: ClippingClass(),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                  child: Hero(
                  tag: Key(widget.product.id.toString()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        widget.product.image,
                        height: 240,
                      ),
                    ],
                  ),
                ),
                )
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(
                  widget.product.name,
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 34),
                ),
              ),
              Text(
                widget.product.desc,
                style: TextStyle(color: Theme.of(context).backgroundColor,fontSize: 18),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Flutter is a cross-platform UI toolkit that is designed to allow code reuse across operating systems such as iOS and Android, while also allowing applications to interface directly with underlying platform services. ... An introduction to widgets: The fundamental building blocks of Flutter user interfaces.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Theme.of(context).backgroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ClippingClass extends CustomClipper<Path>
{
  Path getClip(Size size)
  {
    var path = Path();
    
    path.lineTo(0.0, size.height-40);
    path.quadraticBezierTo(size.width/4, size.height,  size.width/2,size.height);
    
    path.quadraticBezierTo(size.width - (size.width/4), size.height,  size.width,size.height-40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}