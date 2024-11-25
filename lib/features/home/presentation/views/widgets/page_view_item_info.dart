import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/monthly.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/weekly.dart';

class PageViewItemInfo extends StatelessWidget {
  const PageViewItemInfo({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: const [
        Weekly(),
        Monthly(),
      ],
    );
  }
}
