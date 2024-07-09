import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tumora/modules/layout.dart';
import 'package:tumora/shared/color_manager.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //main colors
          primaryColor: ColorManager.primary,
          primaryColorLight: ColorManager.white,
          primaryColorDark: ColorManager.secondary,
          disabledColor: ColorManager.greyLight,
          splashColor: ColorManager.splash,
          //bottom nav theme
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 0,
              backgroundColor: ColorManager.primary,
              unselectedItemColor: ColorManager.secondary,
              selectedItemColor: ColorManager.greydark)),
      home: const HomeScreen(),
    );
  }
}
