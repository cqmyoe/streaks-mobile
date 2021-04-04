// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutritionDataAdapter extends TypeAdapter<NutritionData> {
  @override
  final int typeId = 5;

  @override
  NutritionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NutritionData(
      fields[0].cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, NutritionData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.record);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
