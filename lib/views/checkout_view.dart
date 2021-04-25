import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/cart_service.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: CartService().getProductStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState != ConnectionState.waiting) {
                final List<Product> products = snapshot.data;
                return ListView(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: products.length,
                        itemBuilder: (buildContext, int index) {
                          Product product = products[index];

                          return Card(margin: EdgeInsets.all(6),
                            color: Colors.green[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      SizedBox(width: 30,),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        child: Image.network(
                                          product.imageUrl,scale: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "₹${product.price}",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
