import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snakbarError(
    BuildContext context, FeaturedBooksPaginationFailure state) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.orangeAccent,
      content: Text(
        state.errMessage,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
