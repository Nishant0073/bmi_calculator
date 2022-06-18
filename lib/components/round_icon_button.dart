import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.iconData, required this.onPressed});
  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: () => onPressed(),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
    );
  }
}
