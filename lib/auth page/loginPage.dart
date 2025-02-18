import 'package:flutter/material.dart';
import 'package:social_media/auth%20page/inputDesigner.dart';

class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/Instagram Logo.png',
              scale: 2,
            ),
            const SizedBox(
              height: 50,
            ),
            inputer(
              nameOf: "User name",
            ),
            const SizedBox(
              height: 15,
            ),
            inputer(
              nameOf: "Password",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget password?',
                    style: TextStyle(color: Colors.lightBlue.shade700),
                  )),
            ),
            Container(
                width: 340,
                margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text(
                "Log in with Facebook",
                style: TextStyle(fontSize: 18, color: Colors.lightBlue.shade800),
              ),
              icon: Image.asset(
                "assets/facebook.png",
                scale: 40,
              ),
            ),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.grey,thickness: .45,)),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Text("OR"),
                ),
                Expanded(child: Divider(color: Colors.grey, thickness: .45,)),
              ],
            ),
            const SizedBox(height: 20,),
            RichText(text: const TextSpan(children: [
              TextSpan(text: "Don't have an account? " , style: TextStyle(color: Colors.grey , fontSize: 16)),
              TextSpan(text: "Sign up." , style: TextStyle(color: Colors.lightBlue, fontSize: 17))
            ])),
            const SizedBox(height: 90,),
            const Divider(thickness: .45,),
            TextButton(onPressed: (){}, child: const Text("Instagram or Facebook", style: TextStyle(color: Colors.grey),))
          ],
        ),
      ),
    );
  }
}
