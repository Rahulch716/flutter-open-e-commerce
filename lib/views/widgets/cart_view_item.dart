import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';

class CartItem extends StatelessWidget {
  final Product product;

  CartItem(this.product);

  set total(value) => product.price = value;

  get total => product.price - 1000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.black26,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () => print(Text('hg')),
                        child: Text("Save For Later")),
                    ElevatedButton(
                        onPressed: () => print(Text('jf')),
                        child: Text("Remove")),
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          color: Colors.black54,
          // margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Price Details',
                      style: TextStyle(fontSize: 22, color: Colors.white54),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          'Discount',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          'Delivery Charges',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${product.price}",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          '-₹ 250',
                          style:
                              TextStyle(fontSize: 22, color: Colors.lightGreen),
                        ),
                        Text(
                          'Free',
                          style:
                              TextStyle(fontSize: 22, color: Colors.lightGreen),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Text(
                      '₹ $total',
                      style: TextStyle(fontSize: 22, color: Colors.white),
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
