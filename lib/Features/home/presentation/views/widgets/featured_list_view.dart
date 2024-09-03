import 'package:bookly/Features/home/domins/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntity> books;

  const FeaturedBooksListView({super.key, required this.books});
  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Future<void> _scrollListener() async {
    double currentPosition = _scrollController.position.pixels;
    double maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollLength * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kBookDetailsView,
                    extra: widget.books[index],
                  );
                },
                child: CustomBookImage(
                  imageUrl: widget.books[index].image ?? '',
                ),
              ),
            );
          }),
    );
  }
}
