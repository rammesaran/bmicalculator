import 'package:bmicalculatore/custom/constant.dart';
import 'package:bmicalculatore/custom/resuableicon.dart';
import 'package:bmicalculatore/custom/reusablecard.dart';
import 'package:bmicalculatore/screens/bmi_calculator.dart';
import 'package:bmicalculatore/screens/result_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double height = 80.0;

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedgender;
  int bmiheight = 180;
  int bmiweight = 40;
  int age = 15;

  // Color malecolor = inactivecolor;
// Color femalecolor = inactivecolor;

  // void updatecard(Gender selectedgender) {
  //   if (selectedgender == Gender.male) {
  //     if (malecolor == inactivecolor) {
  //       malecolor = activecolor;
  //       femalecolor = inactivecolor;
  //     } else {
  //       malecolor = inactivecolor;
  //     }
  //   }
  //   if (selectedgender == Gender.female) {
  //     if (femalecolor == inactivecolor) {
  //       femalecolor = activecolor;
  //       malecolor = inactivecolor;
  //     } else {
  //       femalecolor = inactivecolor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bmi Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    ontapped: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    cardwidget: ReusableIcon(
                      icons: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                    color: selectedgender == Gender.male
                        ? kactiveColor
                        : kinactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    ontapped: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    cardwidget: ReusableIcon(
                      icons: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                    color: selectedgender == Gender.female
                        ? kactiveColor
                        : kinactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: klableTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        bmiheight.toString(),
                        style: knumberTextstyle,
                      ),
                      Text(
                        'cm',
                        style: klableTextstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                        value: bmiheight.toDouble() ?? 120.0,
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            bmiheight = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
              color: kactiveColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: klableTextstyle,
                        ),
                        Text(
                          bmiweight.toString(),
                          style: knumberTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyCustomButton(
                                iconData: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    bmiweight--;
                                  });
                                }),
                            SizedBox(
                              width: 20.0,
                            ),
                            MyCustomButton(
                              onpress: () {
                                setState(() {
                                  bmiweight++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: klableTextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumberTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyCustomButton(
                                iconData: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 20.0,
                            ),
                            MyCustomButton(
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kactiveColor,
                  ),
                ),
              ],
            ),
          ),
          LargeButton(
            text: 'Calculate',
            onpress: () {
              BmiCalulator bmiCalulator = BmiCalulator(
                height: bmiheight,
                weight: bmiweight,

              );
            
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultCard(
                        output: bmiCalulator.calcualtebmi(),
                        result: bmiCalulator.getText(),
                        description: bmiCalulator.getDescription(),
                        

                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  final String text;
  final Function onpress;

  LargeButton({@required this.onpress, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      //  (){
      //   Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => ResultCard(),),
      //   );
      // },
      child: Container(
        child: Center(
          child: Text(
            text,
            style: klargeButtonstyle,
          ),
        ),
        color: kbottomColor,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        height: height,
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final Function onpress;
  final IconData iconData;
  MyCustomButton({this.iconData, @required this.onpress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(
          iconData,
          color: Colors.white,
        ),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        onPressed: () {
          onpress();
        });
  }
}
