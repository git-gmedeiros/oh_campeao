import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_oh_campeao/services/auth.dart';
import 'package:projeto_oh_campeao/stores/login_store.dart';
import 'package:projeto_oh_campeao/views/home/home_page.dart';
import 'package:projeto_oh_campeao/views/login/login_screen.dart';
import 'package:projeto_oh_campeao/views/payment_page.dart';
import 'package:projeto_oh_campeao/views/historic.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  LoginStore loginStore;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _showHeader(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud_upload),
            title: Text('Pagamento'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(PaymentPage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud_upload),
            title: Text('Histórico'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(Historic.routeName);
            },
          ),
          Divider(),
          Divider(),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
                onTap: () {
                  Provider.of<LoginStore>(context, listen: false).logout();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              );
            },
          )
        ],
      ),
    );
  }

  Widget _showHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(Auth.getUser() ?? ""),
      accountEmail: Text('Guilherme@gmail.com'),
      currentAccountPicture: CircleAvatar(child: Text('G')),
    );
  }
}
