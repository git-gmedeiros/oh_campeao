import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/models/menu.dart';
import 'package:projeto_oh_campeao/services/menuList.dart';
import 'package:projeto_oh_campeao/views/home/home_page.dart';
import 'package:projeto_oh_campeao/widgets/custom_card.dart';
import 'package:projeto_oh_campeao/widgets/custom_drawer.dart';

class PageMenuList extends StatefulWidget {
  static const String routeName = '/menu';
  @override
  _PageMenuListState createState() => _PageMenuListState();
}

class _PageMenuListState extends State<PageMenuList> {
  List<Product> list = Menu.getMenuList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cardápio")),
      body: CustomCard(_listview()),
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
                          IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  list[index].quantity =
                                      list[index].quantity + 1;
                                });
                              }),
                          Text(list[index].quantity.toString()),
                          IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  list[index].quantity =
                                      list[index].quantity - 1;
                                });
                              })
                        ],
                      )),
                      trailing: Text(list[index].price));
                })),
        CustomCard(Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      child: Text("Para mim"),
                      color: Colors.grey,
                      onPressed: () {
                        Menu.order(list);
                        Navigator.pop(context);
                        /*Navigator.of(context)
                        .pushReplacementNamed(HomePage.routeName);*/
                      },
                    ))),
            Expanded(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      child: Text("Para mesa"),
                      color: Colors.grey,
                      onPressed: () {
                        Menu.orderTable(list);
                        Navigator.pop(context);
                        /* Navigator.of(context)
                        .pushReplacementNamed(HomePage.routeName);*/
                      },
                    )))
          ],
        ))
      ],
    );
  }
}
