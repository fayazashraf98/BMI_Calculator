import 'dart:math';

class Bmi_calculator_formula {
  Bmi_calculator_formula({required this.height, required this.weight});

  final height;
  final weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi >= 25) {
      return 'overweight';
    }
    else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }

  String getResult_det() {
    if (_bmi >= 25) {
      return 'you have a higher than normal body weight. Try to exercise more.';
    }
    else if (_bmi > 18.5) {
      return 'You have a normal Body weight. Good Job!';
    }
    else {
      return 'You have a lower than normal body weight. you can eat a bit more.';
    }
  }

}

