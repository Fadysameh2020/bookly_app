import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'features/splash/data/presentation/views/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(brightness: Brightness.dark).copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      );
    });
  }
}
