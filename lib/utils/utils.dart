import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Util{

  static Widget error(String message){
    return Center(
      child: Text(message)
    );
  }

  static Widget loading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}