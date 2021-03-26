import 'package:flutter/material.dart';
import 'package:opencommerce/controler/auth_controller.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Sign In Page"),
      ),
      body: Container(
        child: Center(child: ElevatedButton(onPressed: signInWithGoogle, child: Text("Sign In"))),
      ),
    ));
  }
}
