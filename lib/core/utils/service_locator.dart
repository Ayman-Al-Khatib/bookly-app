import 'package:bookly/Features/home/data/data_source/home_local_date_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_date_source.dart';
import 'package:bookly/Features/home/data/repositories/home_repositories_impl.dart';
import 'package:bookly/Features/home/domins/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/domins/use_cases/fetch_newest_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRemoteDateSourceImp>(
      HomeRemoteDateSourceImp(getIt.get<ApiService>()));

  getIt.registerSingleton<HomeLocalDateSourceImp>(HomeLocalDateSourceImp());

  getIt.registerSingleton<HomeRepositoriesImpl>(HomeRepositoriesImpl(
    getIt.get<HomeRemoteDateSourceImp>(),
    getIt.get<HomeLocalDateSourceImp>(),
  ));

  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(
      getIt.get<HomeRepositoriesImpl>(),
    ),
  );

  getIt.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(
      getIt.get<HomeRepositoriesImpl>(),
    ),
  );
}
