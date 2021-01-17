// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QRCodeDataAdapter extends TypeAdapter<QRCodeData> {
  @override
  final int typeId = 0;

  @override
  QRCodeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QRCodeData(
      title: fields[0] as String,
      url: fields[1] as String,
      fgColor: fields[2] as Color,
      bgColor: fields[3] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, QRCodeData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.fgColor)
      ..writeByte(3)
      ..write(obj.bgColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QRCodeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
