import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';

class PriceDetails extends StatelessWidget{
  final Product product;
  PriceDetails(this.product);

  get discount=> product.price*10/100 ;
  get total => product.price - discount;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                      '${product.price}',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Text(
                      "$discount",
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
    );
  }


}