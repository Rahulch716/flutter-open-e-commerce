import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter e-commerce',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                "Forgot Password?",
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
                    child: Text("Sign In"),
                  ),
                  ElevatedButton(
                    onPressed: () => print("Signed Up"),
                    child: Text("Sign Up"),
                  ),
                ],
              )
            ],
          ),
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/background1.jpg"),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
