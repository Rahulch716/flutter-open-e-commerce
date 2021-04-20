import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/cart_service.dart';
import 'package:opencommerce/views/widgets/cart_view_item.dart';


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
      ),
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            StreamBuilder(
                stream: CartService().getProductStream(),
                builder: (context, snapShot) {
                  if (snapShot.hasData &&
                      snapShot.connectionState != ConnectionState.waiting) {
                    final List<Product> products = snapShot.data;
                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) =>
                            CartItem(products[index]));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })

            // Visibility(
            //   visible: cart.products.isNotEmpty,
            //   child: ElevatedButton(
            //     onPressed: () {Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (BuildContext context) =>CheckoutView()));},
            //     child: Text('Proceed to Checkout'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
