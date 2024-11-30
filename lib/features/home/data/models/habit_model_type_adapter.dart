import 'package:habit_tracker/features/home/data/models/habit_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HabitModelTypeAdapter extends TypeAdapter<HabitModel> {
  @override
  HabitModel read(BinaryReader reader) {
    return HabitModel(
      title: reader.readString(),
      description: reader.readString(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.description);
  }
}
