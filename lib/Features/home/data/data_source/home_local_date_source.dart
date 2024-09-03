import 'dart:developer';

import 'package:bookly/Features/home/domins/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDateSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDateSourceImp extends HomeLocalDateSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int lenght = box.values.length;
    int limit = 10;
    int startIndex = pageNumber * limit;
    int endIndex = startIndex + limit;
    if (startIndex >= lenght || endIndex > lenght) return [];

    log(box.values.length.toString());
    log(box.values.toList().sublist(startIndex, endIndex).length.toString());
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
