import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_media/pages/test%20dots.dart';
import 'package:social_media/providers.dart';

class home_body extends StatelessWidget {
  home_body({super.key});
  List<Map<String,dynamic>> _remain = [];
  final PageController _controller = PageController();
  Future<List<String>> getids()async{
    List<String> allUIds = [];
    
    var yeLo =  await FirebaseFirestore.instance.collection("users").where("uid" , isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).get();
      var ggGori = yeLo.docs.map((e) => e.data(),).toList();
      for(var haye in ggGori){

        
        
        if(haye.containsKey("following")){
          allUIds.addAll(List<String>.from(haye["following"]));
          //allUIds.add(haye["followers"]);

        }
      }
      
      //print(remainData);
      allUIds.add(FirebaseAuth.instance.currentUser!.uid.toString());
    return allUIds;
  }
  
  
  Stream<List<Map<String,dynamic>>> koiDewana ()async*{
    yield* Stream.fromFuture(getids()).asyncExpand((madad) {
      if(madad.isEmpty){
        return Stream.value([]);
      }
  return FirebaseFirestore.instance.collection("posts").where("uid", whereIn: madad).snapshots().asyncMap((event) async{


      await FirebaseFirestore.instance.collection("users").where("uid" , whereIn: madad).get().then((value) async{
          for(var le in value.docs){
            final gg = await FirebaseFirestore.instance.collection("users").doc(le.id).get();
            
            _remain.add(Map<String,dynamic>.from(gg.data()!));

            
          }
      },);


      var yehy = event.docs;
      List<Map<String,dynamic>> kiaHy = [];
      for(var wow in yehy){
        final androoni = await FirebaseFirestore.instance.collection("posts").doc(wow.id).collection("all").orderBy("createdAt" , descending: true).get();
        //kiaHy = androoni.docs.map((e) => e.data(),).toList();
        kiaHy.addAll(androoni.docs.map((e) => e.data(),).toList());
      }
      return kiaHy;
    },);
    },);
  }
 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: koiDewana(), builder: (context, snapshot) {
      if(snapshot.hasData){
        List<Map<String,dynamic>> keet = snapshot.data!;
        context.read<prove>().messangerClear();
        return keep(keet);
      }
      else{
        return CircularProgressIndicator();
      }
    },);
}

  Expanded keep(List<Map<String,dynamic>> yeLy) {
    return Expanded(
      child: ListView.builder(
        itemCount: yeLy.length,
        itemBuilder: (context, index) {
          if(_remain[index]['uid'] != FirebaseAuth.instance.currentUser!.uid.toString()){
            context.read<prove>().messangerAdd(_remain[index]);
          }
          var items = yeLy[index];
          var yeb = _remain[index];
          //var furtherData = remainData[index];
        return Column(
        children: [
          const Divider(
            thickness: .5,
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      yeb["profile"],
                      scale: 4,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(yeb["name"]),
                           Text(yeb["user"] , style: TextStyle(color: Colors.grey),)
                           ],
                      ),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Dots_test(
            imageLink: items["pic"],
            controller: _controller,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.grey.shade700,
                  )),
              IconButton(
                  onPressed: () {}, icon: Image.asset("assets/Comment.png")),
              IconButton(
                  onPressed: () {}, icon: Image.asset("assets/Messanger.png")),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: WormEffect(
                      activeDotColor: Colors.lightBlue,
                      dotColor: Colors.grey.shade400,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 5),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/Save.png",
                        scale: 1,
                      )),
                ),
              ),
      
             
            ],
          ),
           Padding(
             padding: const EdgeInsets.only(right: 60),
             child: RichText(
              text: const TextSpan(children: [
                  TextSpan(text: "Liked by  'write Name' " , style: TextStyle(color: Colors.black,fontSize: 16)),
                  TextSpan(text: "and '100' others", style: TextStyle(color: Colors.black ,fontSize: 16)),
                ])),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(children: [
              const TextSpan(text: "King Hasni",style: TextStyle(color: Colors.black,fontSize: 16 , fontWeight: FontWeight.w600)),
              TextSpan(text: items["des"],style: TextStyle(color: Colors.black,fontSize: 16 ,)),
             ])),
           )
        ],
      );
      },),
    );
  }}
