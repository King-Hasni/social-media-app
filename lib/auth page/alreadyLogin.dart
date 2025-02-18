import 'package:flutter/material.dart';
import 'package:social_media/auth%20page/auth_handler.dart';
import 'package:social_media/pages/homescreen.dart';

class already_login extends StatelessWidget {
  const already_login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 220,
          ),
          Container(
            margin: const EdgeInsets.all(50),
            child: Image.asset(
              "assets/Instagram Logo.png",
              scale: 2,
            ),
          ),
          Container(
              child: Column(
            children: [
              Image.asset(
                "assets/Oval.png",
                scale: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'king_hasni123',
              )
            ],
          )),
          Container(
              width: 340,
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(7)),
              child: TextButton(
                  onPressed: () async{
                    await auth_handler.instance.google_sign().whenComplete((){
                      print("wow");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => home_scr(),));
                    });
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "SFPRODISPLAYREGULAR"),
                  ))),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Switch accounts',
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.w600 , fontSize: 15),
              )),
          
          const SizedBox(height: 170,),
          const Divider(),
          RichText(text: const TextSpan(children: [
            TextSpan(text: "Don't have an account? " , style: TextStyle(color: Colors.grey , fontSize: 14)),
            TextSpan(text: "Sign up." , style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 15))
          ]))
        
        ],
      ),
    );
  }
}
