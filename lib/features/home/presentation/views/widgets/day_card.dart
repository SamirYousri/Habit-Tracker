import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  const DayCard(
      {super.key, required this.isActive, required this.text, this.onTap});
  final bool isActive;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isActive ? Colors.blue : Colors.grey,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
