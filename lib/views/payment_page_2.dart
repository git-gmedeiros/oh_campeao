import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/services/menuList.dart';
import 'package:projeto_oh_campeao/utils/utils.dart';
import 'package:projeto_oh_campeao/views/home/home_page.dart';
import 'package:projeto_oh_campeao/widgets/custom_card.dart';
import 'package:projeto_oh_campeao/views/payment_card.dart';
import 'package:projeto_oh_campeao/services/menuList.dart';

class PaymentPage2 extends StatefulWidget {
  static const String routeName = '/payment2';
  @override
  _PaymentPage2State createState() => _PaymentPage2State();
}

List myListOrder = Menu.getOrderList();
List orderTable = Menu.getOrderTableList();
bool loading = false;

class _PaymentPage2State extends State<PaymentPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Forma de pagamento'),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        CustomCard(ButtonTheme(
          minWidth: double.infinity,
          height: 100.0,
          child: FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentCardPage()));
            },
            child: Column(// Replace with a Row for horizontal icon + text
                children: <Widget>[
              Icon(Icons.credit_card),
              Text("Cartão online", style: TextStyle(fontSize: 20))
            ]),
          ),
        )),
        CustomCard(ButtonTheme(
            minWidth: double.infinity,
            height: 100.0,
            child: FlatButton(
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                await Future.delayed(Duration(seconds: 2));
                loading = false;
                Menu.clearData();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Column(// Replace with a Row for horizontal icon + text
                  children: <Widget>[
                Icon(Icons.notifications_active),
                loading ? Util.loading() : Text("Chamar o campeão", style: TextStyle(fontSize: 20))
              ]),
            )))
      ],
    );
  }
}
