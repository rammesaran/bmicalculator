import 'dart:math';

class BmiCalulator {
  final int weight;
  final int height;
  double _bmi;

  BmiCalulator({this.height, this.weight});

  String calcualtebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getText() {
    if (_bmi >= 25) {
      return 'over weight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'under weight';
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'Should do exercise';
    } else if (_bmi > 18.5) {
      return ' Good work';
    } else {
      return 'Keep Going';
    }
  }
}
