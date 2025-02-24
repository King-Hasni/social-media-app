import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/selected%20user.dart';
import 'package:social_media/providers.dart';

class msgScr extends StatelessWidget {
  const msgScr({super.key});

  Future<String> getChatId(String aglaWala)async{
    var values = await FirebaseFirestore.instance.collection("chats").where("uid", arrayContains: FirebaseAuth.instance.currentUser!.uid.toString()).get();
    
    var yehy = values;
    String id = "";
      for(var leeo in yehy.docs){
            print("jawan mardan");
          var contribution = leeo.data().values.any((element) {
            if(element.contains(aglaWala)){
              return true;
            }
            else{
              return false;
            }
          });
          //print(contribution);
        if(contribution){
          print("haan bhai mojood hy pehle se");
          id = leeo.id;
          return id; 
        }
        else{
          await FirebaseFirestore.instance.collection("chats").add({
            "uid": [aglaWala , FirebaseAuth.instance.currentUser!.uid.toString()],
          });
          print("new bn gaya");
          id = leeo.id;
          return id;
        }
      }
      await FirebaseFirestore.instance.collection("chats").add({
            "uid": [aglaWala , FirebaseAuth.instance.currentUser!.uid.toString()],
          });
    var newSeFetch = await FirebaseFirestore.instance.collection("chats").where("uid" , arrayContains: FirebaseAuth.instance.currentUser!.uid.toString()).get();
    for(var loloG in newSeFetch.docs){
      var contribution = loloG.data().values.any((element) {
            if(element.contains(aglaWala)){
              return true;
            }
            else{
              return false;
            }
          });
      if(contribution){
        id = loloG.id;
      }
    }

  return id;
      
  }

  @override
  Widget build(BuildContext context) {
    var yeLe = context.watch<prove>().messanger;
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () => Navigator.pop(context),icon: Icon(Icons.arrow_back_ios),),
                      title: Text("King Hasni"), actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],),

      body: Column(children: List.generate(yeLe.length, (index) {
        var Malukiyat = yeLe[index];
        return ListTile(
                onTap: () async{
                  await getChatId(Malukiyat['uid']).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => selectedUser(id: value,),)),);
                  
                },
                leading: Image.network(Malukiyat['profile'] , scale: 4,),
                title: Text(Malukiyat["name"]),
                subtitle: Text(Malukiyat['user']),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                );
      },),),
    );
  }
}