import 'package:hive/hive.dart';

part 'habit_data.g.dart';

@HiveType(typeId: 4)
class HabitData {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final Map<String, bool> record;

  HabitData(this.name, this.record);
}
