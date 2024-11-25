import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.hight,
      required this.width,
      required this.textButton,
      this.onTap,
      required this.textSize,
      required this.isActive});
  final double hight;
  final double width;
  final String textButton;
  final double textSize;
  final void Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: isActive ? Colors.grey[500] : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        height: hight,
        width: width,
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              //  color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
