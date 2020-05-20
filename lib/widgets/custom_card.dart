import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(this.widget);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          child: Padding(padding: const EdgeInsets.all(16), child: widget)),
    );
  }
}
