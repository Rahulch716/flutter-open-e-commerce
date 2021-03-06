import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Page"),
        ),
        body: Column(
          children: [
            Image.asset(
              'images/mobile.png',
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Android Mobile 4gb Ram, 64MP camera",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      print(Text("Moved to Cart"));
                    },
                    child: Text("Move to Cart")),
                ElevatedButton(
                    onPressed: () {
                      print(Text("buy"));
                    },
                    child: Text("Buy Now")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
