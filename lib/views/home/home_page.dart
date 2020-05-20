import 'package:flutter/material.dart';
import 'package:projeto_oh_campeao/models/table.dart';
import 'package:projeto_oh_campeao/services/auth.dart';
import 'package:projeto_oh_campeao/views/Menu/listMenu_page.dart';
import 'package:projeto_oh_campeao/views/order.dart';
import 'package:projeto_oh_campeao/widgets/custom_card.dart';
import 'package:projeto_oh_campeao/widgets/custom_drawer.dart';

import 'package:qrcode/qrcode.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static QRCaptureController _captureController = QRCaptureController();

  bool _isTorchOn = false;
  bool qrcode = false;
  bool ler = false;
  String codigo = "";

  int page = 0;

  @override
  void initState() {
    super.initState();

    _captureController.onCapture((data) {
      print('onCapture----$data');
      if (data == null) {
        codigo = "";
      } else
        codigo = data;
      TableI.setTable(data);
      setState(() {
        qrcode = false;
        page = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> allWidget = <Widget>[
      Expanded(child: CustomCard(Center(child: Text("leia um qrcode")))),
      Expanded(child: CustomCard(PageOrderList())),
    ];

    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        drawer: CustomDrawer(),
        
        body: qrcode
            ? _buildqrcode()
            : Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                    CustomCard(_buildTable()),
                    allWidget[page],
                    CustomCard(codigo == "" ? _buttonQRCode() : _order())
                  ])));
  }

  Widget _buildTable() {
    return Container(
        alignment: Alignment.center,
        child: codigo == ""
            ? Text("Bem vindo " + Auth.getUser())
            : Text("Numero da sua mesa é: " + TableI.getTable()));
  }

  Widget _order() {
    return Container(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
            child: Text("Fazer o pedido"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageMenuList()),
              );
            }));

    /*Navigator.of(context)
                  .pushReplacementNamed(PageMenuList.routeName),
              child: Text("Fazer o pedido")));*/
  }

  Widget _buttonExitTable() {
    return Container(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
          child: Text("Sair da mesa"),
          color: Colors.purple,
          onPressed: () {
            setState(() {
              codigo = "";
              page = 0;
            });
          },
        ));
  }

  Widget _buttonQRCode() {
    return Container(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
          child: Text("Por gentileza leia o QRCODE"),
          color: Colors.deepPurpleAccent,
          onPressed: () {
            setState(() {
              qrcode = true;
              codigo = "";
              page = 1;
            });
          },
        ));
  }

  Widget _buildqrcode() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        QRCaptureView(controller: _captureController),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.white,
                onPressed: () {
                  if (_isTorchOn) {
                    _captureController.torchMode = CaptureTorchMode.off;
                  } else {
                    _captureController.torchMode = CaptureTorchMode.on;
                  }
                  _isTorchOn = !_isTorchOn;
                },
                child: Text('torch'),
              ),
              FlatButton(
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    qrcode = false;
                    page = 0;
                  });
                },
                child: Text('exit'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
