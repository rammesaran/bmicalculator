import 'package:bmicalculatore/custom/constant.dart';
import 'package:bmicalculatore/custom/reusablecard.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class ResultCard extends StatelessWidget {

  final String output;
  final String result;
  final String description;
  ResultCard({@required this.output, @required this.result, @required this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: kresultTextstyle,
              ),
            ),
          ),
         Expanded(
           flex: 5,
           child: ReusableCard(
             color: kactiveColor,
             cardwidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Text(result.toUpperCase(),
                    style: koutputTextstyle,
                    ),
                    Text(output,
                      style: kreadingTextstyle,
                    ),
                     Text(description,
                     textAlign: TextAlign.center,
                      style: kmessageTextstyle,
                    ),
                ], 
             ),
             ),
             ),
             LargeButton(
               onpress: (){
                 Navigator.pop(context);
               
               },
               text: 'Re- Caluclate',
             ),
        ],
      ),
    );
  }
}
