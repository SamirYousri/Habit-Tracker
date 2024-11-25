import 'package:flutter/material.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/item_habit.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/item_info.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ItemInfo();
                },
              ));
            },
            child: const ItemHabit());
      },
    );
  }
}
