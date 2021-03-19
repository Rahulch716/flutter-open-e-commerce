import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opencommerce/models/models.dart';

class ProductService {
  final fireStore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    return fireStore.collection('Products').get().then((snapShot) =>
        snapShot.docs.map((doc) => Product.fromMap(doc.data())).toList());

    /// get snapshot from firebase
  }
}