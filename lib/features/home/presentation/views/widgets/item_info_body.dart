import 'package:flutter/material.dart';
import 'package:habit_tracker/core/widgets/custom_button.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/page_view_item_info.dart';

class ItemInfoBody extends StatefulWidget {
  const ItemInfoBody({super.key});

  @override
  State<ItemInfoBody> createState() => _ItemInfoBodyState();
}

class _ItemInfoBodyState extends State<ItemInfoBody> {
  int currentIndex = 0;
  late PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
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
    );
  }
}
