import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
import 'resuable_card.dart';
import 'calculatorBrain.dart';

class Result_page extends StatelessWidget {
 Result_page(this.bmiCalculate,this.resultBmi,this.feedback);
 final String resultBmi;
 final String bmiCalculate;
 final String feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Your result is',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActiveColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(resultBmi.toUpperCase(),
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(bmiCalculate,
                      style: kResultFontStyle,),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(feedback,
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize: 20.0,
                    ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child:   Container(
              child: Text(
                'RE-Calculate',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              height: 80.0,
              width: double.infinity,
            ),
          ),
         // Expanded(child: child),
        ],
      ),
    );
  }
}

//
// Column(
// children: [
// Container(
// child: Text('Normal'),
// ),
// SizedBox(
// height: 30.0,
// ),
// Container(
// child: Text('68',
// style: kResultFontStyle,),
// ),
// SizedBox(
// height: 30.0,
// ),
// Container(
// child: Text('You should diet'),
// ),
//
// ],
// ),