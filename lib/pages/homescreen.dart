import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/create.dart';
import 'package:social_media/pages/homeBody.dart';
import 'package:social_media/pages/notifications.dart';
import 'package:social_media/pages/profile.dart';
import 'package:social_media/pages/search.dart';
import 'package:social_media/providers.dart';

// ignore: must_be_immutable
class home_scr extends StatelessWidget {
  home_scr({super.key});
  List navScreens = [home_scr(), search() , create() , notifications() , profile()];
  List<String> status = ["Profile Image (1).png" , "Inner Oval.png", "Profile Image1.png", "Profile Image (2).png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(onPressed: (){}, icon: Image.asset("assets/Camera Icon.png",scale: 1,)),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset("assets/Instagram Logo.png" , scale: 3,alignment: Alignment.center,),
        ),
        actions: [IconButton(onPressed: (){}, icon: Image.asset("assets/IGTV.png",scale: 1,)),
        IconButton(onPressed: (){}, icon: Image.asset("assets/Messanger.png" ,scale: 1,))],
      ),
      body: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(status.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Image.asset("assets/${status[index]}",scale: .9,),
                  Text("King")
                ],
              ),
            );
          },),),
        ),
        home_body(),
      ],),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled) , label: "Home" , backgroundColor: Colors.white , ),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Profile"),
      ],
      currentIndex: navScreens[context.watch<prove>().current],
      onTap: (value) {
        context.read<prove>().changeValue(value);
      },),
    );
  }
}