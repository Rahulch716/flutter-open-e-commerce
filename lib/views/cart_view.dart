import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';

class Cart extends StatelessWidget {
  final Product product;

  Cart(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: ListView.builder(
          // itemCount: ,
          // itemBuilder: ,
        ),
      ),
    );
  }
}
