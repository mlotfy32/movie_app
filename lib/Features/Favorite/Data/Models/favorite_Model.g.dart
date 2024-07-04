// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteModelAdapter extends TypeAdapter<FavoriteModel> {
  @override
  final int typeId = 2;

  @override
  FavoriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteModel(
      Poster_Url: fields[0] as String,
      overView: fields[1] as String,
      release_date: fields[2] as String,
      title: fields[3] as String,
      vote_average: fields[4] as double,
      vote_count: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.Poster_Url)
      ..writeByte(1)
      ..write(obj.overView)
      ..writeByte(2)
      ..write(obj.release_date)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.vote_average)
      ..writeByte(5)
      ..write(obj.vote_count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
