import 'package:bookly/Features/home/data/data_source/home_local_date_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_date_source.dart';
import 'package:bookly/Features/home/domins/entities/book_entity.dart';
import 'package:bookly/Features/home/domins/repositories/home_repositories.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoriesImpl extends HomeRepositories {
  final HomeRemoteDateSource homeRemoteDateSource;
  final HomeLocalDateSource homeLocalDateSource;
  HomeRepositoriesImpl(this.homeRemoteDateSource, this.homeLocalDateSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books =
          homeLocalDateSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }

      books =
          await homeRemoteDateSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books = homeLocalDateSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDateSource.fetchNewestBooks();
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
