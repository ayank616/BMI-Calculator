import 'package:bmi_calculator/data/constants.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.icon, required this.onPress});

  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 20,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15.0),
        backgroundColor: const Color(0xFF4C4F5E),
      ),
      child: Icon(icon),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.onPress, required this.label});
  final void Function()? onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 55,
        color: const Color(0xFF8B0000),
        child: Center(
          child: Text(
            label,
            style: kBottomButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
