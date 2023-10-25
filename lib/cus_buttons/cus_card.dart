import 'package:flutter/material.dart';

class CusCard extends StatelessWidget {
  CusCard({required this.colour, this.child, this.onPress});
  final Color colour;
  final Widget? child;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Remove the parentheses here
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
