import 'package:hive/hive.dart';

part 'nutrition_data.g.dart';

@HiveType(typeId: 6)
class NutritionData {
  @HiveField(0)
  final List<String> record;

  NutritionData(this.record);
}
