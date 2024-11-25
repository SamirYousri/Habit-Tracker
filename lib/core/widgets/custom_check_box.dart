import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? Colors.blue : Colors.grey[300],
      ),
      height: 40,
      width: 40,
      duration: const Duration(milliseconds: 30),
      child: Icon(
        Icons.check,
        size: 30,
        color: isActive ? Colors.white : Colors.grey,
      ),
    );
  }
}
