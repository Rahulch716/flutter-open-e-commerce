import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';


class CartItem extends StatelessWidget {
  final Product product;
  CartItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.black54,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        product.name,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Flexible(
                      child: Image.network(
                        product.imageUrl,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${product.price}",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Delivery By',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListTile(
                        tileColor: Colors.black54,
                        title: Text(
                          'Save For Later',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          print(Text('xd'));
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                          tileColor: Colors.black54,
                          title: Text(
                            'Remove',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection("Cart")
                                .doc(product.id)
                                .delete();
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
