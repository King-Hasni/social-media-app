import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/auth%20page/auth_handler.dart';
import 'package:social_media/pages/homeBody.dart';
import 'package:social_media/pages/messageScreen.dart';
import 'package:social_media/pages/photoscreen.dart';
import 'package:social_media/pages/profile.dart';
import 'package:social_media/pages/search.dart';
import 'package:social_media/providers.dart';

// ignore: must_be_immutable, camel_case_types
class home_scr extends StatelessWidget {
  home_scr({super.key});
  List<String> status = ["Profile Image (1).png" , "Inner Oval.png", "Profile Image1.png", "Profile Image (2).png"];
  List navScreens = [search() , photo() , profile()];
  
  @override
  Widget build(BuildContext context){
    context.read<prove>().context = context;
    int yeHy = context.watch<prove>().current;
    return Scaffold(
      appBar: yeHy == 0 ? AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(onPressed: () async{
          await auth_handler.instance.signout();
        }, icon: Image.asset("assets/Camera Icon.png",scale: 1,)),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset("assets/Instagram Logo.png" , scale: 3,alignment: Alignment.center,),
        ),
        actions: [IconButton(onPressed: (){}, icon: Image.asset("assets/IGTV.png",scale: 1,)),
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => msgScr(),));
          print("wow");
        }, icon: Image.asset("assets/Messanger.png" ,scale: 1,))],
      ) : null,
      body: yeHy == 0 ? StreamBuilder(stream: FirebaseFirestore.instance.collection("users").where(
        "uid" , isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()
      ).snapshots(), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LinearProgressIndicator(),);
        }
        else if(snapshot.hasError || !snapshot.hasData){
          return const Center(child: Text("No Data Found"),);
        }
        else{
          var yeHy = snapshot.data!.docs.map((e) => e.data(),).toList();
          late Map<String,dynamic> wow;
          
          for (var element in yeHy) {
            wow = element;
          }
          context.read<prove>().add(wow);
          //print(wow);
          return body(yeHy);
        }
      },):  navScreens[yeHy - 1],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled) , label: "Home" , backgroundColor: Colors.white , ),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: "add photo"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Profile"),
      ],
      currentIndex: context.watch<prove>().current,
      onTap: (value) {
        context.read<prove>().changeValue(value);
      },),
    );
  }

  Column body(List<Map<String, dynamic>> yeHy) {
    return Column(children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(status.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Image.asset("assets/${status[index]}",scale: .9,),
                const Text("King")
              ],
            ),
          );
        },),),
      ),
      home_body(),
    ],);
  }
}