
import 'package:flutter/services.dart';


class Auth {
  
  static String userId= "";
  
  static Future<String> signIn(String email, String password) async {
    

    userId = "Guilherme";
    return "Guilherme";
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
