import 'package:bookly/Features/home/domins/entities/book_entity.dart';
import 'package:bookly/Features/home/domins/repositories/home_repositories.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepositories homeRepositories;
  FetchFeaturedBooksUseCase(this.homeRepositories);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepositories.fetchFeaturedBooks(pageNumber: param);
  }
}
