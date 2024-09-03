import 'package:bookly/Features/home/presentation/views/widgets/custon_book_image_loading_indecator.dart';
import 'package:bookly/core/utils/function/widgets/custon_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoaddingIndecator extends StatelessWidget {
  const FeaturedBooksListViewLoaddingIndecator({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CustonBookImageLoadingIndecator(),
              );
            }),
      ),
    );
  }
}
