import 'package:bookly/Features/home/domins/entities/book_entity.dart';
import 'package:bookly/Features/home/domins/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewestBooksUseCase) : super(NewsetBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
