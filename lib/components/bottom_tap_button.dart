import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomTapButton extends StatelessWidget {
  BottomTapButton({required this.onTap, required this.buttonTitle});
  final onTap;
  final buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kCalculateButton,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10.0),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}

