import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/auth%20page/alreadyLogin.dart';
import 'package:social_media/firebase_options.dart';
import 'package:social_media/pages/homescreen.dart';
import 'package:social_media/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(ChangeNotifierProvider(create: (context) => prove(), child:const  MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //wow
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      
      home: FirebaseAuth.instance.currentUser != null ? home_scr() : const already_login(),
    );
  }
}