// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_current_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentModelAdapter extends TypeAdapter<CurrentModel> {
  @override
  final int typeId = 3;

  @override
  CurrentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentModel(
      fields[0] as int,
      fields[1] as int,
      (fields[2] as List).cast<Weather>(),
    );
  }

  @override
  void write(BinaryWriter writer, CurrentModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.currentTimeTimeStamp)
      ..writeByte(1)
      ..write(obj.temp)
      ..writeByte(2)
      ..write(obj.weather);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
