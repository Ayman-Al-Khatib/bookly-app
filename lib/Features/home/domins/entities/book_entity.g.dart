// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      bookId: fields[0] as String,
      image: fields[1] as String?,
      title: fields[2] as String,
      autherName: fields[3] as String?,
      price: fields[4] as num?,
      averageRating: fields[5] as num?,
      ratingsCount: fields[6] as int?,
      previewLink: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.autherName)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.averageRating)
      ..writeByte(6)
      ..write(obj.ratingsCount)
      ..writeByte(7)
      ..write(obj.previewLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
