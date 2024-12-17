import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CoffeeType(
      {super.key,
      required this.text,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Container(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.orange : Colors.white),
        )),
      ),
    );
  }
}
