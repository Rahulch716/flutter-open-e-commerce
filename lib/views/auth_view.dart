import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Sign_in.dart';
import 'home_view.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          var user = snapshot.data;
          if (user == null) {
            return SignInView();
          } else {
            return HomeView();
          }
        }
      },
    );
  }
}
