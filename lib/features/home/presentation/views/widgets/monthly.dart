import 'package:flutter/material.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/day_card.dart';

class Monthly extends StatefulWidget {
  const Monthly({super.key});

  @override
  State<Monthly> createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  List<bool> activeDays = List.generate(31, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Which days will you choose in month?',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 265,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 31,
            itemBuilder: (context, index) {
              return DayCard(
                isActive: activeDays[index],
                text: '${index + 1}',
                onTap: () {
                  setState(() {
                    activeDays[index] = !activeDays[index];
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
