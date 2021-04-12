import 'package:flutter/material.dart';
import 'package:opencommerce/controler/auth_controller.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Container(
        child: ElevatedButton(
          child: Text("Sign In With Google"),
          onPressed: () {
            signInWithGoogle();
          },
        ),
      ),
    )));
  }
}
