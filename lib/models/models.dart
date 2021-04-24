import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.description,
    this.manufacturer,
    // this.inStock,
  });

  String id;
  String name;
  double price;
  String imageUrl;
  String description;
  String manufacturer;

  // bool inStock;

  Product copyWith({
    String id,
    String name,
    double price,
    String imageUrl,
    String description,
    String manufacturer,
    // bool inStock,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        manufacturer: manufacturer ?? this.manufacturer,
        // inStock: inStock ?? this.inStock,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        description: json["description"] == null ? null : json["description"],
        manufacturer:
            json["manufacturer"] == null ? null : json["manufacturer"],
        // inStock: json["inStock"] == null ? null : json["inStock"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "description": description == null ? null : description,
        "manufacturer": manufacturer == null ? null : manufacturer,
        // "inStock": inStock == null ? null : inStock,
      };
}

// To parse this JSON data, do
//
//     final profile = profileFromMap(jsonString);

Profile profileFromMap(String str) => Profile.fromMap(json.decode(str));

String profileToMap(Profile data) => json.encode(data.toMap());

class Profile {
  Profile({
    this.name,
    this.email,
    this.phone,
    this.state,
    this.city,
    this.pin,
    this.landmark,
    this.address,
    this.mobile,
  });

  String name;
  String email;
  String phone;
  String state;
  String city;
  String pin;
  String landmark;
  String address;
  String mobile;

  Profile copyWith({
    String name,
    String email,
    String phone,
    String state,
    String city,
    String pin,
    String landmark,
    String address,
    String mobile,
  }) =>
      Profile(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        state: state ?? this.state,
        city: city ?? this.city,
        pin: pin ?? this.pin,
        landmark: landmark ?? this.landmark,
        address: address ?? this.address,
        mobile: mobile ?? this.mobile,
      );

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        pin: json["pin"] == null ? null : json["pin"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        address: json["address"] == null ? null : json["address"],
        mobile: json["mobile"] == null ? null : json["mobile"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "pin": pin == null ? null : pin,
        "landmark": landmark == null ? null : landmark,
        "address": address == null ? null : address,
        "mobile": mobile == null ? null : mobile,
      };
}
