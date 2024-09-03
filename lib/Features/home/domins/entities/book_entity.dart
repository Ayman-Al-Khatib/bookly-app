import 'package:hive_flutter/hive_flutter.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? autherName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? averageRating;
  @HiveField(6)
  final int? ratingsCount;
  @HiveField(7)
  final String? previewLink;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.averageRating,
    required this.ratingsCount,
    required this.previewLink,
  });
}
