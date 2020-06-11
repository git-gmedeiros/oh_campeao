import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/services/menuList.dart';
import 'package:projeto_oh_campeao/views/home/home_page.dart';
import 'package:projeto_oh_campeao/views/payment_page_2.dart';
import 'package:projeto_oh_campeao/widgets/custom_card.dart';


class PaymentPage extends StatefulWidget {
  static const String routeName = '/payment';
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

List myListOrder = Menu.getOrderList();
List orderTable = Menu.getOrderTableList();


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
        Expanded(child: CustomCard(listOrder())),
       // CustomCard(Text("Comanda da mesa")),
       // Expanded(child: CustomCard(listOrderTable())),
        CustomCard(Text("Total: R\$ 150,00")),
        CustomCard(FlatButton(
          onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage2()));},
          child: Text("Pagar", style: TextStyle(fontSize: 20)),                  
        ))
      ],
    );
  }

  static Widget listOrder() {
    return ListView.builder(
        itemCount: myListOrder == null ? 0 : myListOrder.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(myListOrder[index].name),
              subtitle: Center(
                  child: Row(
                children: <Widget>[
                  Text(myListOrder[index].quantity.toString()),
                ],
              )),
              trailing: Text(myListOrder[index].price));
        });
  }

 /* static Widget listOrderTable() {
    return ListView.builder(
        itemCount: orderTable == null ? 0 : orderTable.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(orderTable[index].name),
              subtitle: Center(
                  child: Row(
                children: <Widget>[
                  Text(orderTable[index].quantity.toString()),
                ],
              )),
              trailing: Text(orderTable[index].price));
        });
  }*/
}
