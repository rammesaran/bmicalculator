import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardwidget;
  final Function ontapped;

  ReusableCard({@required this.color, this.cardwidget, this.ontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontapped,
      
          child: Container(
        child: cardwidget,
        height: 200.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
