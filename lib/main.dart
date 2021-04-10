import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/auth_view.dart';
import 'package:opencommerce/views/home_view.dart';
import 'package:opencommerce/views/product_updator.dart';
import 'package:opencommerce/views/widgets/cart_view_product.dart';
import 'package:opencommerce/views/widgets/profile_page.dart';
import 'package:opencommerce/views/widgets/profile_update_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool initialized = false;

  @override
  void initState() {
    initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter e-commerce',
      home:
      initialized ? CartView() : Center(child: CircularProgressIndicator()),
    );
  }

  void initApp() async {
    await Firebase.initializeApp();
    setState(() {
      initialized = true;
    });
  }
}
