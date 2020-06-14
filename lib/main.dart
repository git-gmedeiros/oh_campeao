import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/stores/login_store.dart';
import 'package:projeto_oh_campeao/themes/theme.dart';
import 'package:projeto_oh_campeao/views/Menu/listMenu_page.dart';
import 'package:projeto_oh_campeao/views/home/home_page.dart';
import 'package:projeto_oh_campeao/views/login/login_screen.dart';
import 'package:projeto_oh_campeao/views/login/sign_up.page.dart';
import 'package:projeto_oh_campeao/views/payment_page.dart';
import 'package:projeto_oh_campeao/views/payment_page_2.dart';
import 'package:projeto_oh_campeao/views/root_page.dart';
import 'package:projeto_oh_campeao/views/sign_in_page.dart';
import 'package:projeto_oh_campeao/views/historic.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'Oh Campeão',
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          cursorColor: Colors.orange,
          scaffoldBackgroundColor: Colors.deepPurpleAccent,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          LoginScreen.routeName: (context) => new LoginScreen(),
          SignUpPage.routeName: (context) => new SignUpPage(),
          HomePage.routeName: (context) => new HomePage(),
          PaymentPage.routeName: (context) => new PaymentPage(),
          PaymentPage2.routeName: (context) => new PaymentPage2(),
          Historic.routeName: (context) => new Historic(),
          PageMenuList.routeName: (context) => new PageMenuList()
        },
        home: RootPage(),
      ),
    );
  }
}
