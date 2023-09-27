import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMssg});
  final String errorMssg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMssg,
        style: Styles.textStyle18,
      ),
    );
  }
}
