
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/re_usable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_tap_button.dart';


class ResultPage extends StatelessWidget {

   ResultPage({required this.bmi,required this.bmiResult,required this.bmiComment});
   final String bmiResult ;
   final String bmi;
   final String bmiComment;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Center(child: Text("Your Result",style: kYourResultText),)),
          Expanded(
            flex: 5,
            child: ReusableCard(color: kActiveCardColor, cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(bmiResult ,style: kBodyStatusText,),
                Text(bmi ,style: kBMIScoreText),
                Text(bmiComment,style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
              ],
            )
              ,onPress: (){},),
          ),
          BottomTapButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
