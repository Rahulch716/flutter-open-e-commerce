import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product 1",
                          style: TextStyle(fontSize: 22),
                        ),
                        Image.asset(
                          'images/mobile.png',
                          scale: 8,
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('Price 5446')],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
