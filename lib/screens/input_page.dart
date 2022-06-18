import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/re_usable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/bottom_tap_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Genders {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Genders selectedGender = Genders.male;
  late int currentHeight = 180;
  late int currentWeight = 50;
  late int currentAge = 18;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Genders.male;
                    });
                  },
                  color: selectedGender == Genders.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    cardIcon: FontAwesomeIcons.mars,
                    cardTitle: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Genders.female;
                    });
                  },
                  color: selectedGender == Genders.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    cardIcon: FontAwesomeIcons.venus,
                    cardTitle: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: ReusableCard(
          onPress: () {},
          color: kActiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT',
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '$currentHeight',
                    style: kNumberTextStyle,
                  ),
                  Text(
                    'cm',
                    style: kLabelTextStyle,
                  ),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                  inactiveTrackColor: Color(kIconFontColor),
                  thumbColor: Color(0xFFEB1555),
                  activeTrackColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  overlayColor: Color(0x29EB1555),
                  // overlayColor: Color(0x29EB1555),
                ),
                child: Slider(
                  value: currentHeight.toDouble(),
                  min: 120,
                  max: 220,
                  onChanged: (double newValue) {
                    setState(() {
                      currentHeight = newValue.toInt();
                    });
                  },
                ),
              ),
            ],
          ),
        )),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {},
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        '$currentWeight',
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                print(currentWeight);
                                currentWeight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                currentWeight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {},
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        '$currentAge',
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                currentAge--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(
                                () {
                                  currentAge++;
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomTapButton(
          onTap: () {
            CalculatorBrain calculatorBrain = CalculatorBrain(weight: currentWeight, height: currentHeight);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  ResultPage( bmi: calculatorBrain.calculateBMI(),bmiResult: calculatorBrain.getResult(), bmiComment: calculatorBrain.getComment()),
                ));
          },
          buttonTitle: 'CALCULATE',
        )
      ],
    );
  }
}

