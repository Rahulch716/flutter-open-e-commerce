import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pixel 4a"),
        ),
        body: Column(
          children: [
            Image(
              image: AssetImage("images/background1.jpg"),
              height: 180,
              width: 150,
            ),
            SizedBox(height: 20),
            Text(
              "Pixel 4a 6GB Ram, 64GB Storage 16MP Camera ",
              style: TextStyle(fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}
