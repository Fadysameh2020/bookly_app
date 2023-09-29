import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/book_model/book_name.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: '19.99€',
            onPressed: () {},
            backGroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'Free Preview',
            onPressed: () async {
              Uri uri = Uri.parse(bookModel.volumeInfo?.previewLink ?? '');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                print('Can not launch $uri');
              }
            },
            backGroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
