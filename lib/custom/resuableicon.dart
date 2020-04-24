
import 'package:bmicalculatore/custom/constant.dart';
import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  final String text;
  final IconData icons;
  ReusableIcon({@required this.icons, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: klableTextstyle,
        ),
      ],
    );
  }
}