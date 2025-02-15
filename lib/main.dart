import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //wow
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Oval.png"),

            const Center(child: Text("Might is Right , Jis Ki Latti Uski Bhens"
            , style: TextStyle(fontSize: 30, fontFamily: 'SFPRODISPLAYREGULAR',fontStyle: FontStyle.italic),),),
          ],
        ),
      ),
    );
  }
}