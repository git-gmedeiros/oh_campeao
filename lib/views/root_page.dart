
import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/services/auth.dart';
import 'package:projeto_oh_campeao/views/login/login_screen.dart';
import 'package:projeto_oh_campeao/views/sign_in_page.dart';

import 'package:projeto_oh_campeao/views/home/home_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return _login();
    /*new StreamBuilder<String>(
      stream: Auth.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          String user = snapshot.data;
          if (user == null) {
            return SignInPage();
          }
          return HomePage();
        } else {
          return _showWaitingContainer();
        }
      },
    );*/
  }

  Widget _login(){
    String userId = Auth.getUser();
    
    if(userId == ""){
      return LoginScreen();
    }else{
      return HomePage();
    }

  }
  Widget _showWaitingContainer() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
