// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitDataAdapter extends TypeAdapter<HabitData> {
  @override
  final int typeId = 4;

  @override
  HabitData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitData(
      fields[0] as String,
      (fields[1] as Map)?.cast<String, bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, HabitData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.record);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
