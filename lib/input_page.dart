import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'calculatorBrain.dart';
import 'result_page.dart';

enum GenderType{
  none,
  male,
  female
}


class Input_page extends StatefulWidget {
  const Input_page({Key? key}) : super(key: key);

  @override
  _Input_pageState createState() => _Input_pageState();
}

class _Input_pageState extends State<Input_page> {
  GenderType selectedGender=GenderType.none;
  int height=180;
  int weight=60;
  int age=19;


  Color maleActiveColor=kIinactiveColor;
  Color femaleActiveColor=kIinactiveColor;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                       selectedGender=GenderType.male;
                        print("malePressed");
                      });
                    },
                  child: ReusableCard(
                    selectedGender == GenderType.male ? kActiveColor :kIinactiveColor,
                        Column(
                          children: [
                            IconCard(FontAwesomeIcons.mars,
                                'MALE'),

                          ],
                        ),

                  ),
                ),
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: (){
                     setState(() {
                      selectedGender=GenderType.female;
                       print("femalePressed");
                     });
                    },
                  child: ReusableCard(selectedGender==GenderType.female ?kActiveColor :kIinactiveColor,
                    Column(
                      children: [
                        IconCard(FontAwesomeIcons.venus,
                            'FEMALE'),

                      ],
                    ),),
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(kActiveColor, Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('Height',
                style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),
                    style: kFontTextStyle),
                    Text('cm',
                    style: kLabelTextStyle),

                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTickMarkColor: Color(0xFF8D8E99),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x291555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                  ),
                  child:  Slider(
                    value:height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newvalue) {
                      setState(() {
                        height=newvalue.round();
                      });
                    }

                ),
                ),


              ],
            ),),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(kActiveColor, Column(
                    children: [
                     Text('Weight',
                     style: kLabelTextStyle,),
                      Text(weight.toString(),
                      style: kFontTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        FloatingActionButton(
                          backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              Icons.add,
                              size: 40.0,
                              color: Colors.white,
                            ),
                            onPressed: (){
                            setState(() {
                              weight++;
                            });
                            }),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              })

                        ],
                      ),

                    ],
                  ),),
                ),
                Expanded(
                  child: ReusableCard(kActiveColor, Column(
                    children: [
                      Text('Age',
                        style: kLabelTextStyle,),
                      Text(age.toString(),
                        style: kFontTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              })
                        ],
                      ),

                    ],
                  ),),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain clc=CalculatorBrain(height,weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Result_page(clc.bmiCalculate(),clc.getResult(),clc.getFeedback());
              }));
            },
            child:   Container(
              child: Text(
                'Calculate',
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

        ],
      ),
    );
  }
}













