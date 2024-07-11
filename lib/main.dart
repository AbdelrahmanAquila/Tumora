import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tumora/modules/login/login_screen.dart';
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
        useMaterial3: true,
        //main colors
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.white,
        primaryColorDark: ColorManager.secondary,
        disabledColor: ColorManager.greyLight,
        splashColor: ColorManager.splash,
        //bottom nav theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: ColorManager.primary,
            unselectedItemColor: ColorManager.greydark,
            selectedItemColor: ColorManager.secondary),
        //input decoration theme
        inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: ColorManager.primary),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            contentPadding: const EdgeInsets.only(left: 20),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: ColorManager.primary))),
      ),
      home: const LoginScreen(),
    );
  }
}
