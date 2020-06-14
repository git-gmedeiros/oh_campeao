import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/models/menu.dart';
import 'package:projeto_oh_campeao/services/menuList.dart';
import 'package:projeto_oh_campeao/views/payment_page.dart';

class PageOrderList extends StatefulWidget {
  static const String routeName = '/order';
  @override
  _PageOrderListState createState() => _PageOrderListState();
}

class _PageOrderListState extends State<PageOrderList> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listview(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.credit_card),
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentPage()),
          );
        },
      ),
    );
  }

  Widget _listview() {
    double total = 0.0;
    List<Product> list = Menu.getOrderList();
    return Column(
      children: <Widget>[
        Container(
          child: Text("Total:  R\$ " + Menu.getTotalOrder().toStringAsFixed(2)),
          padding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: list == null ? 0 : list.length,
                itemBuilder: (BuildContext context, int index) {             
                  total += list[index].valor *
                                  list[index].quantity;
                  return ListTile(
                      title: Text(list[index].nome),
                      subtitle: Center(
                          child: Row(
                        children: <Widget>[
                          Text(list[index].quantity.toString() + "                 "),
                          list[index].order == "individual" ? Icon(Icons.person) : Icon(Icons.people),
                          list[index].order == "individual" ? Text("") : Text("5") 
                        ],
                      )),
                      trailing: Text("R\$ " +
                          (list[index].valor *
                                  list[index].quantity)
                              .toStringAsFixed(2)));
                })),
      ],
    );
  }
}
