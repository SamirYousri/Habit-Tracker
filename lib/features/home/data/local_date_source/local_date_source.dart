import 'package:habit_tracker/features/home/data/models/habit_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDateSource {
  Future<void> addHabit(HabitModel habitModel) async {
    var box = Hive.box<HabitModel>('habit');
    await box.add(habitModel);
  }

  List<HabitModel> getAllHabit() {
    var box = Hive.box<HabitModel>('habit');
    return box.values.toList();
  }

  Future<void> deleteHabit(int index) async {
    var box = Hive.box<HabitModel>('habit');
    await box.deleteAt(index);
  }
}
