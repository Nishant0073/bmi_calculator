import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class IconContent extends StatelessWidget {
  IconContent({required this.cardIcon,required this.cardTitle});
  final IconData cardIcon ;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(cardTitle,style:kLabelTextStyle,),
        SizedBox(
          height: 5.0,
        )
      ],
    );
  }
}
