import 'package:dio/dio.dart';
import 'package:flutter/services.dart';


class Auth {
  
  static String userId= "";
  
  static String signIn(String email, String password){
    
    var data = [];

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

    userId = "Guilherme";
    return "NOK";
  }

  static Future<String> signUp(String cpf, String password, String name, String phone) async {
    print(cpf);
    return "Cadastrado";
  }

  static Future<void> signOut() async {
    userId = "";
  }

  static Future<bool> checkUserExist(String userId) async {
    bool exists = false;
    
  }

  static String getUser() {
    return userId;
  }

  static String getExceptionText(Exception error) {
    if (error is PlatformException) {
      return error.message;
    } else {
      return 'Unknown error occured.';
    }
  }
}
