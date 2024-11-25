import 'package:flutter/material.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/creat_habit.dart';
import 'package:habit_tracker/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Habit Tracker',
            style: TextStyle(
              fontSize: 25,
              //  color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CreatHabit();
                  },
                ));
              },
              icon: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
