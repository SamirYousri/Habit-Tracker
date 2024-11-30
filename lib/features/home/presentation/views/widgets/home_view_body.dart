import 'package:flutter/material.dart';
import 'package:habit_tracker/core/widgets/custom_check_box.dart';
import 'package:habit_tracker/features/home/data/local_date_source/local_date_source.dart';
import 'package:habit_tracker/features/home/data/models/habit_model.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/item_info.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final LocalDateSource localDateSource = LocalDateSource();
  late List<HabitModel> habits;

  @override
  void initState() {
    super.initState();
    _loadHabits();
  }

  Future<void> _loadHabits() async {
    setState(() {
      habits = localDateSource.getAllHabit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return habits.isEmpty
        ? const Center(
            child: Text(
            'Enter your habits',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ))
        : ListView.builder(
            itemCount: habits.length,
            itemBuilder: (context, index) {
              final habit = habits[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ItemInfo();
                      },
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                      top: 10,
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: Text(
                                habit.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                habit.description,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const CustomCheckBox(
                                isActive: false,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '3 / 5   in weeks',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await localDateSource.deleteHabit(index);
                                    await _loadHabits();
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          );
  }
}
