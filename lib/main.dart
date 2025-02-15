import 'package:flutter/material.dart';
import 'package:social_media/auth%20page/loginPage.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //wow
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(style: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: "SFPRODISPLAYREGULAR"))))
      ),
      home: login_page(),
    );
  }
}