import 'package:flutter/material.dart';
import 'package:opencommerce/views/cart_view.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add_shopping_cart_outlined),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => CartView()));
      },
    );
  }
}
