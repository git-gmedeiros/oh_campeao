import 'dart:convert';



class Order {
  String productId;
  String name;
  String price;
  int quantity = 0;

  Order({
    this.productId,
    this.name,
    this.price,
    this.quantity
  });

  /*factory User.fromDocument(DocumentSnapshot document) {
    return User.fromMap(document.data);
  }*/

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
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
