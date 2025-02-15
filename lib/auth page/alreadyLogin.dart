import 'package:flutter/material.dart';

class already_login extends StatelessWidget {
  const already_login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 220,
          ),
          Container(
            margin: EdgeInsets.all(50),
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
              SizedBox(
                height: 10,
              ),
              const Text(
                'king_hasni123',
              )
            ],
          )),
          Container(
              width: 340,
              margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(7)),
              child: TextButton(
                  onPressed: () {},
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
          
          SizedBox(height: 170,),
          Divider(),
          RichText(text: const TextSpan(children: [
            TextSpan(text: "Don't have an account? " , style: TextStyle(color: Colors.grey , fontSize: 14)),
            TextSpan(text: "Sign up." , style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 15))
          ]))
        
        ],
      ),
    );
  }
}
