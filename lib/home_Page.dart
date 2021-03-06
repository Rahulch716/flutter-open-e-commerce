import 'package:flutter/material.dart';
import 'package:opencommerce/detailed_Page.dart';

final products = ["Pixel 4a", "OnePlus 7", "Realme X2", "Narzo 20 Pro", "Realme 7 Pro"];

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("YouBuy"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = products[index];
            return ListTile(
              title: Text(
                product,
                style: TextStyle(fontSize: 30),
              ),
              subtitle: Text("Android"),
              leading: Image.asset("images/background1.jpg"),
              contentPadding: EdgeInsets.all(4),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailedPage(),

                    ));
              },
            );
          },
        ),
      ),
    ));
  }
}
