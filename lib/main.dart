import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/homescreen.dart';
import 'package:social_media/providers.dart';


void main() {
  
  runApp(ChangeNotifierProvider(create: (context) => prove(), child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //wow
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:home_scr(),
    );
  }
}