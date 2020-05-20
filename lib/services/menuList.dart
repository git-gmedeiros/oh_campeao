import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:projeto_oh_campeao/models/menu.dart';

class Menu {
  static List<Product> data;
  static List<Product> dataOrder;
  static List<Product> dataOrderTable;



  static Future<bool> menuList() async {
/*
    var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );

  var l = [
  {
    "productId": 1,
    "price": 25,
    "name": "Macarrão",
  },
  {
   "productId": 2,
    "price": 35,
    "name": "Suco",
    },
  {
    "productId": 3,
    "price": 45,
    "name": "Coca-cola",
    }
  ];


  Iterable list = json.decode(response.body);

    print(response.body);
    data = list.map((model) => Product.fromJson(model)).toList();
*/

    data = [
      Product(
          name: "macarrão", price: "R\$ 25,00", productId: "1", quantity: 0),
      Product(name: "Suco", price: "R\$ 30,00", productId: "2", quantity: 0),
      Product(name: "coca", price: "R\$ 5,00", productId: "3", quantity: 0),
      Product(name: "torta", price: "R\$ 3,00", productId: "4", quantity: 0)
    ];

    return true;
  }

  static List getMenuList() {
    return data;
  }

  static void order(List list) {
    var post = list.toString();
    print(post);
    menuList();
  }

  static void orderTable(List list) {
    var post = list.toString();
    print(post);
    menuList();
  }

  static Future<bool> orderList() async {
    /*var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );

  var l = [
  {
    "productId": 1,
    "price": 25,
    "name": "Macarrão",
  },
  {
   "productId": 2,
    "price": 35,
    "name": "Suco",
    },
  {
    "productId": 3,
    "price": 45,
    "name": "Coca-cola",
    }
  ];


  Iterable list = json.decode(response.body);

    print(response.body);
    data = list.map((model) => Product.fromJson(model)).toList();*/

    dataOrder = [
      Product(
          name: "suco de uva", price: "R\$ 25,00", productId: "1", quantity: 3),
      Product(name: "carne", price: "R\$ 30,00", productId: "2", quantity: 5),
      Product(name: "coca", price: "R\$ 5,00", productId: "3", quantity: 1),
      Product(name: "torta", price: "R\$ 3,00", productId: "4", quantity: 1)
    ];

    return true;
  }

  static List getOrderList() {
    return dataOrder;
  }

  static Future<bool> orderTableList() async {
    /*var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );

  var l = [
  {
    "productId": 1,
    "price": 25,
    "name": "Macarrão",
  },
  {
   "productId": 2,
    "price": 35,
    "name": "Suco",
    },
  {
    "productId": 3,
    "price": 45,
    "name": "Coca-cola",
    }
  ];


  Iterable list = json.decode(response.body);

    print(response.body);
    data = list.map((model) => Product.fromJson(model)).toList();*/

    dataOrderTable = [
      Product(
          name: "suco de laranja", price: "R\$ 15,00", productId: "1", quantity: 5),
      Product(name: "finho", price: "R\$ 30,00", productId: "2", quantity: 2),
      Product(name: "bolo", price: "R\$ 50,00", productId: "3", quantity: 4),
      Product(name: "salgado", price: "R\$ 5,00", productId: "4", quantity: 2)
    ];

    return true;
  }

  static List getOrderTableList() {
    return dataOrderTable;
  }

}
