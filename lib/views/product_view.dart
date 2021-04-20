import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/product_updator.dart';
import 'package:opencommerce/views/widgets/cart_icon.dart';


class ProductView extends StatefulWidget {
  final Product product;

  ProductView(this.product);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.product.name}"),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FillProduct(widget.product)),
                );
                setState(() {});
              },
            ),
            CartIcon()
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(
                widget.product.imageUrl,
                height: 300.0,
              ),
              Text(
                widget.product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(widget.product.description),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("Cart")
                            .doc(widget.product.id)
                            .set(widget.product.toMap(),
                                SetOptions(merge: true));

                        var snackBar = SnackBar(
                          content:
                              Text("${widget.product.name} Added To The Cart"),
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text('Add to Cart')),
                  ElevatedButton(onPressed: () {}, child: Text('Buy Now')),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

// class DynamicView extends StatelessWidget {
//   final Widget widget;
//
//   DynamicView(this.widget);
//
//   @override
//   Widget build(BuildContext context) {
//     return widget;
//   }
// }
