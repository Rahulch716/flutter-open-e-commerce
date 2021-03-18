import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opencommerce/models/models.dart';

class ProductService {
  final fireStore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    return fireStore.collection('Products').get().then((snapShot) =>
        snapShot.docs.map((doc) => Product.fromMap(doc.data())).toList());

    /// get snapshot from firebase
    var snapShot = await fireStore.collection("Products").get();
    var _products = <Product>[];
    for (var doc in snapShot.docs) {
      var json = doc.data();

      /// convert json to product object
      var p = Product.fromMap(json);
      _products.add(p);
    }
    return _products;
  }
}