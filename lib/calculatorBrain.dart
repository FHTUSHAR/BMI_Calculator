import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);
  final int height;
  final int weight;

  double _bmi=0;//it can't be null

  String bmiCalculate() {
    _bmi = weight / pow(height / 100, 2);//we make it here cm to meter
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {

    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getFeedback() {
    if (_bmi >= 25) {
      return 'You should excersize more';
    } else if (_bmi >= 18.5 && _bmi <25) {
      return 'Good job';
    } else {
      return 'You should eat more';
    }
  }
}
