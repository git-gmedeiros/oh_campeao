import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/models/menu.dart';
import 'package:projeto_oh_campeao/services/menuList.dart';
import 'package:projeto_oh_campeao/views/home/home_page.dart';
import 'package:projeto_oh_campeao/views/payment_page.dart';
import 'package:projeto_oh_campeao/widgets/custom_card.dart';
import 'package:projeto_oh_campeao/widgets/custom_drawer.dart';

class PageOrderList extends StatefulWidget {
  static const String routeName = '/order';
  @override
  _PageOrderListState createState() => _PageOrderListState();
}

class _PageOrderListState extends State<PageOrderList> {
  List<Product> list = Menu.getOrderList();

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
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: list == null ? 0 : list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(list[index].name),
                      subtitle: Center(
                          child: Row(
                        children: <Widget>[
                          Text(list[index].quantity.toString()),
                        ],
                      )),
                      trailing: Text(list[index].price));
                })),
      ],
    );
  }
}
