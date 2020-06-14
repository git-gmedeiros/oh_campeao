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

  double total = 0;

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
        Container(
          child: Text("Total:  R\$ " + total.toStringAsFixed(2).toString()),
          padding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                    ),
                itemCount: list == null ? 0 : list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(list[index].nome),
                      subtitle: Center(
                          child: Row(
                        children: <Widget>[
                          IconButton(
                              color: list[index].quantity == 0
                                  ? Colors.transparent
                                  : Colors.black,
                              icon: Icon(Icons.remove),
                              onPressed: list[index].quantity == 0
                                  ? () {}
                                  : () {
                                      setState(() {
                                        list[index].quantity =
                                            list[index].quantity - 1;
                                        total -=
                                            list[index].valor;
                                      });
                                    }),
                          Text(list[index].quantity.toString()),
                          IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  list[index].quantity =
                                      list[index].quantity + 1;
                                  total += list[index].valor;
                                });
                              })
                        ],
                      )),
                      trailing: Text("R\$ " + list[index].valor.toString()));
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirmar pedido individual"),
                              content: Text(
                                  "Deseja continuar com o pedido individual ?"),
                              actions: [
                                FlatButton(
                                  child: Text("Confirmar"),
                                  onPressed: () {
                                    for (int i = 0; i < list.length; i++) {
                                      list[i].order = "individual";
                                    }
                                    Menu.order(list);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text("cancelar"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ))),
            Expanded(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      child: Text("Para mesa"),
                      color: Colors.grey,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirmar pedido para mesa"),
                              content: Text(
                                  "Deseja continuar com o pedido para mesa ?"),
                              actions: [
                                FlatButton(
                                  child: Text("Confirmar"),
                                  onPressed: () {
                                    for (int i = 0; i < list.length; i++) {
                                      list[i].order = "mesa";
                                    }
                                    Menu.orderTable(list);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text("cancelar"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )))
          ],
        ))
      ],
    );
  }
}
