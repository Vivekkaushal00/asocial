
import 'package:asocial/name_screen.dart';
import 'package:asocial/page_4.dart';
import 'package:asocial/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          title: "Asocial",
          debugShowCheckedModeBanner: false,
          home: NameScreen(),
        );
      },
    );
  }
}
