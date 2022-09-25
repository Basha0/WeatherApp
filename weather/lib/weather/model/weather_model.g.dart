// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 0;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      cityName: fields[0] as String?,
      lat: fields[1] as double?,
      lon: fields[2] as double?,
      timezone: fields[3] as String?,
      timezoneOffset: fields[4] as int?,
      current: fields[5] as CurrentModel?,
      daily: (fields[6] as List?)?.cast<DailyModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.lat)
      ..writeByte(2)
      ..write(obj.lon)
      ..writeByte(3)
      ..write(obj.timezone)
      ..writeByte(4)
      ..write(obj.timezoneOffset)
      ..writeByte(5)
      ..write(obj.current)
      ..writeByte(6)
      ..write(obj.daily);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
