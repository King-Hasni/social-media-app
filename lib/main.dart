import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //wow
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text("Might is Right , Jis Ki Latti Uski Bhens"
        , style: TextStyle(fontSize: 30, fontFamily: 'Coralcandyregulardemo',fontStyle: FontStyle.italic),),),
      ),
    );
  }
}