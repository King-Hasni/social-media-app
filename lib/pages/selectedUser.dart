import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class selected_user extends StatefulWidget {
  selected_user({super.key, required this.fetcher});

  Map<String, dynamic> fetcher;

  @override
  State<selected_user> createState() => _selected_userState();
}

class _selected_userState extends State<selected_user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where("uid", isEqualTo: widget.fetcher["uid"])
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              snapshot.data!.docs.map((e) => e.data(),).toList().forEach((element) {
                widget.fetcher = element;
              },);
              return Column(children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                    margin: EdgeInsets.only(right: 280),
                    child: IconButton(
                      onPressed: () async {

                        var yele = snapshot.data!;
                        var gg = snapshot.data!.docs.map(
                          (e) => e.data().keys.any(
                                (element) =>
                                    element.contains(widget.fetcher["uid"]),
                              ),
                        );

                        var bhabhai = snapshot.data!.docs
                            .map(
                              (e) => e.data(),
                            )
                            .toList();
                        late Map<String, dynamic> g;
                        bhabhai.forEach(
                          (element) {
                            g = element;
                          },
                        );
                        List<dynamic> dek = g["followers"] ;
                        if (dek.contains(FirebaseAuth.instance.currentUser!.uid.toString())) {
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(yele.docs.first.id)
                              .update({
                            "followers":
                                FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid.toString()])
                          }).whenComplete(
                            () {
                              print("g hogya un-folow");
                               widget.fetcher.clear();
                             var gChar =  snapshot.data!.docs.map((e) => e.data(),).toList();
                             gChar.forEach((element) {
                               widget.fetcher = element;
                             },);
                             FirebaseFirestore.instance.collection("users").where("user" , isEqualTo: FirebaseAuth.instance.currentUser!.email.toString()).get().then((value) {
                        FirebaseFirestore.instance.collection("users").doc(value.docs.first.id).update({
                          "following" : FieldValue.arrayRemove([widget.fetcher["uid"]]),
                        });
                      },);
                      
                      
                            },
                          );
                        } else {
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(yele.docs.first.id)
                              .update({
                            "followers":
                                FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid.toString()])
                          }).whenComplete(
                            () {
                              print("g hogya folow");
                              widget.fetcher.clear();
                             var gChar =  snapshot.data!.docs.map((e) => e.data(),).toList();
                             gChar.forEach((element) {
                               widget.fetcher = element;
                             },);
                             FirebaseFirestore.instance.collection("users").where("uid" , isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).
                             get().then((value) {
                        FirebaseFirestore.instance.collection("users").doc(value.docs.first.id).update({
                          "following" : FieldValue.arrayUnion([widget.fetcher["uid"]]),
                        });
                      },);
                      
                      
                            },
                          );
                        }
                      },
                      icon: Icon(Icons.follow_the_signs_sharp),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Image.asset("assets/Oval.pngs"),
                    
                    widget.fetcher["profile"].toString().isNotEmpty ? Image.network(widget.fetcher["profile"] , scale: 2,) : Icon(Icons.image),

                    const Column(
                      children: [
                        Text("",
                          //widget.fetcher["posts"]!.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
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
                          widget.fetcher["followers"].toString().length > 1? widget.fetcher["followers"].length!.toString() : "0",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
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
                          widget.fetcher["following"].toString().length > 1 ? widget.fetcher["following"].length!.toString() : "0",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
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
                        widget.fetcher["name"]!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        widget.fetcher["user"],
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
              ]);
            } else {
              return Text("");
            }
          },
        ));
  }
}
