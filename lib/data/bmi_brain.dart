import 'dart:math';

class BmiBrain {
  BmiBrain({this.height, this.weight});

  final int? height;
  final int? weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    //double _bmi = weight! / (height! * height! ) / 100;
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi < 18.5) {
      return 'Underweight';
    } else {
      return 'Healthy';
    }
  }

  String bmiMessafe() {
    if (_bmi >= 25) {
      return "You're overweight. Maybe it's time to consider taking the stairs instead of the elevator.";
    } else if (_bmi >= 18.5) {
      return "You're in the healthy weight range. Congratulations! Keep it up!";
    } else {
      return "You're underweight! Time to eat some extra chocolate!";
    }
  }
}
