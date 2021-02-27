import 'package:flutter/material.dart';
export 'main.dart';

class PageSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            leading: BackButton(onPressed: () {
              Navigator.pop(context);
            }),
            title: Text("Signup Page"),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: "First Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: "Create a Password",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Submitted");
                      },
                      child: Text("SignUp"))
                ],
              ),
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/background1.jpg"),
                fit: BoxFit.cover,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
