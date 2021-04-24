import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/cart_service.dart';
import 'package:opencommerce/views/checkout_view.dart';
import 'package:opencommerce/views/widgets/cart_view_item.dart';
import 'package:opencommerce/views/widgets/price_details.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          actions: [IconButton(icon: Icon(Icons.house), onPressed: (){Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => PriceDetails(Product())));})],
        ),
        body: Stack(alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  StreamBuilder(
                      stream: CartService().getProductStream(),
                      builder: (context, snapShot) {
                        if (snapShot.hasData &&
                            snapShot.connectionState !=
                                ConnectionState.waiting) {
                          final List<Product> products = snapShot.data;
                          return ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) =>
                                  CartItem(products[index]));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),

                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CheckoutView()));
              },
              child: Text('Proceed to checkout'),
            ),
          ],
        ));
  }
}
