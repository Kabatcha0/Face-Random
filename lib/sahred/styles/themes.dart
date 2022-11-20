import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 197, 195, 195),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light, statusBarColor: Colors.grey)),
  brightness: Brightness.light,
);
ThemeData themeDark = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 48, 47, 47),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark, statusBarColor: Colors.grey)),
    brightness: Brightness.dark);
