import 'package:flutter/material.dart';
import 'package:habit_tracker/core/widgets/custom_button.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/item_info_body.dart';

class CreatHabit extends StatelessWidget {
  const CreatHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Habit Tracker',
            style: TextStyle(
              fontSize: 20,
              // color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                  hight: 40,
                  width: 60,
                  textButton: 'save',
                  textSize: 20,
                  isActive: true),
            ),
          ],
        ),
        body: const ItemInfoBody(),
      ),
    );
  }
}
