import 'dart:convert';



class Product {
  String productId;
  String name;
  String price;
  int quantity = 0;

  Product({
    this.productId,
    this.name,
    this.price,
    this.quantity
  });

  /*factory User.fromDocument(DocumentSnapshot document) {
    return User.fromMap(document.data);
  }*/

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        productId: json["productId"] == null ? null : json["productId"],
        name: json["name"] == null ? null : json["name"],
        price: json["email"] == null ? null : json["email"],
        
      );

  Map<String, dynamic> toMap() => {
        "userID": productId == null ? null : productId,
        "name": name == null ? null : name,
        "email": price == null ? null : price,
      };

}
