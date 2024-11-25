import 'package:flutter/material.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/day_card.dart';

class Weekly extends StatefulWidget {
  const Weekly({super.key});

  @override
  State<Weekly> createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  List<bool> activeDays = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Which days will you choose in week ?',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DayCard(
              isActive: activeDays[0],
              text: 'Mon',
              onTap: () {
                setState(() {
                  activeDays[0] = !activeDays[0];
                });
              },
            ),
            DayCard(
              isActive: activeDays[1],
              text: 'Tue',
              onTap: () {
                setState(() {
                  activeDays[1] = !activeDays[1];
                });
              },
            ),
            DayCard(
              isActive: activeDays[2],
              text: 'Wed',
              onTap: () {
                setState(() {
                  activeDays[2] = !activeDays[2];
                });
              },
            ),
            DayCard(
              isActive: activeDays[3],
              text: 'Thu',
              onTap: () {
                setState(() {
                  activeDays[3] = !activeDays[3];
                });
              },
            ),
            DayCard(
              isActive: activeDays[4],
              text: 'Fri',
              onTap: () {
                setState(() {
                  activeDays[4] = !activeDays[4];
                });
              },
            ),
            DayCard(
              isActive: activeDays[5],
              text: 'Sat',
              onTap: () {
                setState(() {
                  activeDays[5] = !activeDays[5];
                });
              },
            ),
            DayCard(
              isActive: activeDays[6],
              text: 'Sun',
              onTap: () {
                setState(() {
                  activeDays[6] = !activeDays[6];
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
