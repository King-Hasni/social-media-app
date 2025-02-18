import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/auth%20page/auth_handler.dart';
import 'package:social_media/image%20picker/imageHandler.dart';
import 'package:social_media/providers.dart';

class profile extends StatelessWidget {
  const profile({super.key });

  
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> fetcher = context.watch<prove>().data;
    String wow = fetcher["profile"];//context.read<prove>().data["profile"];
    print(wow);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Text(fetcher["name"]!),
        ),
        actions: [
          IconButton(onPressed: () {
            print(fetcher);
          }, icon: const Icon(Icons.more_horiz_sharp))
        ],
      ),
      body: body(fetcher , context , wow),
    );
  }

  Column body(Map<String,dynamic> fetcher , BuildContext context , String wow) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Image.asset("assets/Oval.pngs"),
           

            IconButton(onPressed: () async{
                await image_Handler.instance.pickImage().then((value) async {
                  final yehy = await image_Handler.instance.uploadProfile(value);
                  
                  final yeHyG = await FirebaseFirestore.instance.collection("users").
                  where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).get();
                  print(" sahib yehi link hy");
                  await FirebaseFirestore.instance.collection("users").doc(yeHyG.docs.first.id).update({
                    "profile": yehy,
                  });
                },);
              },
              //icon: Icon(Icons.image),
               icon : wow.isNotEmpty ? Image.file(File(fetcher["profile"]) , fit: BoxFit.cover,) : Icon(Icons.image),
               ),


            Column(
              children: [
                Text(
                  fetcher["posts"]!.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                const Text(
                  "Posts",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  fetcher["followers"]!.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                const Text(
                  "followers",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  fetcher["following"]!.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                const Text(
                  "following",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 110, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fetcher["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const Text(
                "this is king hasni, game developer",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
            width: 350,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: .7),
                borderRadius: BorderRadius.circular(8)),
            child: TextButton(
                onPressed: () {
                  auth_handler.instance.signout().whenComplete(() {
                    Navigator.pop(context.watch<prove>().context);
                  },);
                },
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ))),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) {
              return Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 130, 219, 91),
                    ),
                  ),
                  const Text("New")
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_frames,
                  size: 40,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.contacts,
                  size: 40,
                )),
          ],
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.green
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
