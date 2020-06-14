import 'dart:convert';

import 'dart:ffi';

class Product {
  String nome;
  String categoria;
  double valor;
  bool disponivel;
  int id;
  double quantity;
  String order;

  Product({this.nome, this.categoria, this.valor, this.disponivel, this.id, this.quantity});

  Product.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    categoria = json['categoria'];
    valor = json['valor'];
    disponivel = json['disponivel'];
    id = json['id'];
    quantity = 0;
    order = "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['categoria'] = this.categoria;
    data['valor'] = this.valor;
    data['disponivel'] = this.disponivel;
    data['id'] = this.id;
    return data;
  }
}