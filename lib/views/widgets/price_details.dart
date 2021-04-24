import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/cart_service.dart';

class PriceDetails extends StatelessWidget {
  final Product product;

  PriceDetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: StreamBuilder(
          stream: CartService().getProductStream(),
          builder: (context, snaShot) {
            final List<Product> products = snaShot.data;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                Product product = products[index];
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "${product.price}",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "Discount Price",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    ));
  }
}
