import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/models/menu.dart';
import 'package:projeto_oh_campeao/services/menuList.dart';
import 'package:projeto_oh_campeao/views/payment_page_2.dart';
import 'package:projeto_oh_campeao/widgets/custom_card.dart';

class PaymentPage extends StatefulWidget {
  static const String routeName = '/payment';
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Pagamento'),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        CustomCard(Text("Comanda")),
        Expanded(child: CustomCard(listOrder())),
        CustomCard(Text("Total R\$   " + Menu.getTotalOrder().toStringAsFixed(2))),
        CustomCard(FlatButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentPage2()));
          },
          child: Text("Pagar"),
        ))
      ],
    );
  }

  static Widget listOrder() {
    List<Product> myListOrder = Menu.getOrderList();
    return ListView.builder(
        itemCount: myListOrder == null ? 0 : myListOrder.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(myListOrder[index].nome),
              subtitle: Center(
                  child: Row(
                children: <Widget>[
                  Text(myListOrder[index].quantity.toString() + "          "),
                  myListOrder[index].order == "individual"
                      ? Icon(Icons.person)
                      : Icon(Icons.people),
                  myListOrder[index].order == "individual"
                      ? Text("")
                      : Text("5")
                ],
              )),
              trailing: Text("R\$  " + (myListOrder[index].valor *
                      myListOrder[index].quantity)
                  .toStringAsFixed(2)));
        });
  }
}
