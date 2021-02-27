import 'package:flutter/material.dart';
import 'package:opencommerce/Sign%20up%20page.dart';

void main() {
  runApp(MaterialApp(
    title: 'YouBuy',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("images/Logo_Auradix.png")),
                SizedBox(height: 50,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Login Id",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                Text(
                  "Forgot Passwords",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => print("Signed In"),
                      child: Text("Log In"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageSignUp()),
                        );
                      },
                      child: Text("Sign Up"),
                    ),
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/background1.jpg"),
              fit: BoxFit.cover,
            )),
          ),
        ),
      ),
    );
  }
}
