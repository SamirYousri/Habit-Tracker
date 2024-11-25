import 'package:flutter/material.dart';
import 'package:habit_tracker/core/widgets/custom_button.dart';
import 'package:habit_tracker/features/home/data/local_date_source/local_date_source.dart';
import 'package:habit_tracker/features/home/data/models/habit_model.dart';

import 'package:habit_tracker/features/home/presentation/views/widgets/page_view_item_info.dart';

class CreatHabit extends StatefulWidget {
  const CreatHabit({super.key});

  @override
  State<CreatHabit> createState() => _CreatHabitState();
}

class _CreatHabitState extends State<CreatHabit> {
  final LocalDateSource localDateSource = LocalDateSource();
  int currentIndex = 0;
  late PageController controller = PageController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                  onTap: () async {
                    final newHabit = HabitModel(
                      description: descriptionController.text,
                      title: titleController.text,
                      id: DateTime.now().millisecondsSinceEpoch,
                    );
                    await localDateSource.addHabit(newHabit);
                    Navigator.pop(context);
                  },
                  hight: 40,
                  width: 60,
                  textButton: 'save',
                  textSize: 20,
                  isActive: true),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Habit title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: descriptionController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Habit description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              isActive: currentIndex == 0,
                              textSize: 18,
                              hight: 40,
                              width: 90,
                              textButton: 'Weekly',
                              onTap: () {
                                setState(() {
                                  currentIndex = 0;
                                });
                                controller.animateToPage(
                                  0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomButton(
                              isActive: currentIndex == 1,
                              textSize: 18,
                              hight: 40,
                              width: 90,
                              textButton: 'Monthly',
                              onTap: () {
                                setState(() {
                                  currentIndex = 1;
                                });
                                controller.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PageViewItemInfo(
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
