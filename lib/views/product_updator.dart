import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FillProduct extends StatefulWidget {
  @override
  _FillProductState createState() => _FillProductState();
}

class _FillProductState extends State<FillProduct> {
  final nameController = TextEditingController();
  final imageUrlController = TextEditingController();
  final priceController = TextEditingController();
  final inStockController = TextEditingController();
  final descriptionController = TextEditingController();
  final manufacturerController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    imageUrlController.dispose();
    priceController.dispose();
    inStockController.dispose();
    descriptionController.dispose();
    manufacturerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("EDIT"),
      ),
      body: Container(
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Name of Product",
                  enabledBorder: OutlineInputBorder()),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: imageUrlController,
              decoration: InputDecoration(
                  labelText: "Image Url",
                  enabledBorder: OutlineInputBorder()),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                  labelText: "Price of Product",
                  enabledBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: manufacturerController,
              decoration: InputDecoration(
                  labelText: "Manufacturer",
                  enabledBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                  labelText: "Product Description",
                  enabledBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: inStockController,
              decoration: InputDecoration(
                  labelText: "In Stock", enabledBorder: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {
                  updateProduct();
                },
                child: Text("Update"))
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    ));


  }
  void updateProduct (){
    String name = nameController.text;
    String imageUrl = imageUrlController.text;
    String manufacturer = manufacturerController.text;
    String description = descriptionController.text;
    String price = priceController.text;
    String inStock = inStockController.text;
    //bool inStock = forBool  == 'true';

    Map<String, dynamic> product = {
      "name": name == null ? null : name,
      "price": price == null ? null : price,
      "imageUrl": imageUrl == null ? null : imageUrl,
      "manufacturer": manufacturer == null ? null : manufacturer,
      "description": description == null ? null : description,
      "inStock": inStock == null ? null : inStock,


    };
    FirebaseFirestore.instance.collection("Products").add(product);

  }
}

