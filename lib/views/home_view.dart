import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/controler/auth_controller.dart';
import 'package:opencommerce/controler/product_controler.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/product_service.dart';
import 'package:opencommerce/views/product_updator.dart';
import 'package:opencommerce/views/product_view.dart';
import 'package:opencommerce/views/profile_page.dart';
import 'package:opencommerce/views/profile_update_view.dart';
import 'package:opencommerce/views/widgets/cart_icon.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Free Commerce"),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                signOut();
              },
            ),
            CartIcon()
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.blue,
                child: SizedBox(
                  height: 150.0,
                  child: Icon(
                    Icons.person,
                    size: 60.0,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                child: ListTile(
                  title: Text(
                    "Profile",
                    style: TextStyle(fontSize: 21),
                  ),
                  onTap: () async {
                    Profile _profile;

                    /// fetch profile from firebase if exist
                    final user = FirebaseAuth.instance.currentUser;
                    DocumentSnapshot doc = await FirebaseFirestore.instance
                        .collection("profiles")
                        .doc(user.uid)
                        .get();
                    if (doc.exists) {
                      _profile = Profile.fromMap(doc.data());
                    }

                    if (_profile != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView(_profile)));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileUpdate(profile: Profile())));
                    }
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FillProduct(Product())));
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: StreamBuilder<List<Product>>(
            stream: ProductService().getProductStream(),
            builder: (context, snapShot) {
              if (snapShot.hasData &&
                  snapShot.connectionState != ConnectionState.done) {
                final List<Product> products = snapShot.data;
                return ListView.builder(
                  // itemCount: productController.products.length,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = products[index];
                    return ListTile(
                      leading: Image.network(product.imageUrl),
                      title: Text(product.name),
                      subtitle: Text("${product.price}"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductView(product)),
                        );
                      },
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
