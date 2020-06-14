import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'dart:async';
import 'dart:convert';

import 'package:projeto_oh_campeao/models/menu.dart';

class Menu {
  static List<Product> data = List<Product>();
  static List<Product> dataOrder = List<Product>();
  static List<Product> dataOrderTable  = List<Product>();

  static double total = 0.0;
  static double totalTable = 0.0;
  static double totalOrder = 0.0;

  static Future<bool> menuList() async {    

    data = [];
    Response response = await Dio().request(
      "http://ohcampeao.ddns.net/api/produto/todos",
      options: Options(headers: {"Accept": "application/json"})
    );
    var produto = response.data["resultData"];

    print(produto);

    for(Map<String,dynamic> item in produto){
      data.add(Product.fromJson(item));
    }        

    return true;
  }

  static List getMenuList() {
    return data;
  }


   static void order(List<Product> list) {
    var post = list.toString();
    if (list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].quantity > 0) {
          dataOrder.add(list[i]);
          total += list[i].valor * list[i].quantity;
          totalOrder += list[i].valor * list[i].quantity;
        }
      }
    }
    print(post);
    menuList();
  }

  static void orderTable(List<Product> list) {
    //var post = list.toString();
    //dataOrderTable = list;
    //list.setAll(list.length, dataOrderTable);
    if (list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].quantity > 0) {
          dataOrderTable.add(list[i]);
          totalTable += list[i].valor * list[i].quantity;
          totalOrder += (list[i].valor * list[i].quantity) / 5;
          list[i].valor = list[i].valor / 5;
          dataOrder.add(list[i]);
        }
      }
    }
    //print(post);
    menuList();
  }

   static Future<bool> orderList() async {
    /*var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );

  Iterable list = json.decode(response.body);

    print(response.body);
    data = list.map((model) => Product.fromJson(model)).toList();*/
/*
    dataOrder = [
      Product(
          name: "suco de uva", price: "25.00", productId: "1", quantity: 3),
      Product(name: "carne", price: "30.00", productId: "2", quantity: 5),
      Product(name: "coca", price: "5.00", productId: "3", quantity: 1),
      Product(name: "torta", price: "3.00", productId: "4", quantity: 1)
    ];
*/
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

  Iterable list = json.decode(response.body);

    print(response.body);
    data = list.map((model) => Product.fromJson(model)).toList();*/
/*
    dataOrderTable = [
      Product(
          name: "suco de laranja", price: "15.00", productId: "1", quantity: 5),
      Product(name: "finho", price: "30.00", productId: "2", quantity: 2),
      Product(name: "bolo", price: "50.00", productId: "3", quantity: 4),
      Product(name: "salgado", price: "5.00", productId: "4", quantity: 2)
    ];
*/
    return true;
  }

  static List getOrderTableList() {
    return dataOrderTable;
  }


  static double getTotal() {
    return total;
  }

  static double getTotalOrder() {
    return totalOrder;
  }

  static double getTotalTable() {
    return totalTable;
  }

  static void clearData() {
    dataOrder = [];
    dataOrderTable = [];;

    total = 0.0;
    totalTable = 0.0;
    totalOrder = 0.0;

  }
  
}
