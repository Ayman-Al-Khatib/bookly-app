import 'package:bookly/Features/home/domins/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> saveBooksData(List<BookEntity> books, String baxName) async {
  var box = Hive.box<BookEntity>(baxName);
  await box.addAll(books);
}
