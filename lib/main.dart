import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';
import 'calculatorBrain.dart';

void main() {
  runApp(const BMI_calculator());
}
class BMI_calculator  extends StatelessWidget {
  const BMI_calculator ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
       home: Input_page(),

    );
  }
}




