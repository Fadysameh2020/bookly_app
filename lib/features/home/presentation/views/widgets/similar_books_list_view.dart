import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CustomBookImage(
                imageUrl:
                    'http://books.google.com/books/content?id=9GwrmHRl490C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
          );
        },
      ),
    );
  }
}
