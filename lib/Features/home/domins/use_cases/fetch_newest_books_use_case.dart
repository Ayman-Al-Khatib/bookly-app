import 'package:bookly/Features/home/domins/entities/book_entity.dart';
import 'package:bookly/Features/home/domins/repositories/home_repositories.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepositories homeRepositories;
  FetchNewestBooksUseCase(this.homeRepositories);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepositories.fetchNewestBooks();
  }
}
