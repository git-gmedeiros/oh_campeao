import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/services/menuList.dart';
import 'package:projeto_oh_campeao/views/home/home_page.dart';
import 'package:projeto_oh_campeao/widgets/custom_card.dart';

class PaymentCardPage extends StatefulWidget {
  static const String routeName = '/payment';
  @override
  _PaymentCardPageState createState() => _PaymentCardPageState();
}

List myListOrder = Menu.getOrderList();
List orderTable = Menu.getOrderTableList();

enum SingingCharacter { credito, debito }

class _PaymentCardPageState extends State<PaymentCardPage> {
// ...

  SingingCharacter _character = SingingCharacter.credito;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Cartões'),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        CustomCard(RadioListTile<SingingCharacter>(
          title: const Text('Crédito', style: TextStyle(fontSize: 20)),
          value: SingingCharacter.credito,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        )),
        CustomCard(RadioListTile<SingingCharacter>(
          title: const Text('Débito', style: TextStyle(fontSize: 20)),
          value: SingingCharacter.debito,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        )),
        const Divider(
            height: 200,
        ),
        CustomCard(FlatButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text("Pagar", style: TextStyle(fontSize: 20)),
        )),
      ],
    );
  }
}
