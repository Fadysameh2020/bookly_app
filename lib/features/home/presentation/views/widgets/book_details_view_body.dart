import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/book_model/book_name.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                        'http://books.google.com/books/content?id=9GwrmHRl490C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  bookModel.volumeInfo?.title ?? '',
                  style: Styles.textStyle30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    bookModel.volumeInfo?.authors?[0] ?? '',
                    style: Styles.textStyle18
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(height: 8),
                BookRating(
                  pages: bookModel.volumeInfo?.pageCount ?? 0,
                  bookType: bookModel.volumeInfo?.printType ?? '',
                ),
                SizedBox(height: 4.h),
                BooksAction(
                  bookModel: bookModel,
                ),
                SizedBox(height: 4.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    textAlign: TextAlign.left,
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const SimilarBooksListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
