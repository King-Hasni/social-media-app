import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class selectedUser extends StatefulWidget {
  selectedUser({super.key , required this.id});

  final String id;

  @override
  State<selectedUser> createState() => _selectedUserState();
}

class _selectedUserState extends State<selectedUser> {
  TextEditingController _cont = TextEditingController();

  FocusNode _node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () => Navigator.pop(context),icon: Icon(Icons.arrow_back_ios),),
                      title: Text("King Hasni"), actions: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.call)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("chats").doc(widget.id).collection("all").orderBy("timestamp" , descending: false).snapshots().map((event) => event.docs.map((e) => e.data(),).toList(),),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var grab = snapshot.data!;
            return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    height: 700,
                    child: ListView.builder(
                      itemCount: grab.length,
                      itemBuilder: (context, index) {
                        var items = grab[index];
                        print("jawan mardan");
                      return Align(
                        alignment: items["uid"] == FirebaseAuth.instance.currentUser!.uid.toString() ? Alignment.topRight : Alignment.topLeft,
                        child: Container(

                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: items["uid"] == FirebaseAuth.instance.currentUser!.uid.toString() ? Colors.green.shade100 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(items['msg'], style: TextStyle(fontSize: 18),)));
                    },),
                  ),
                )
              ],),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  juwaa(context),
                  IconButton(onPressed: (){
                    if(_cont.text.isEmpty) return;
                    FirebaseFirestore.instance.collection("chats").doc(widget.id).collection("all").add({
                      "msg" : _cont.text,
                      "uid" : FirebaseAuth.instance.currentUser!.uid.toString(),
                      "timestamp" : FieldValue.serverTimestamp()
                    }).whenComplete(() {
                      setState(() {
                       _cont.clear();
                      });
                       
                    },);
                  }, icon: Icon(Icons.send))
                ],
              ),
            ),
          ],);
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return Center(child: Text("no data"));
          }
          
        }
      ),
    );
  }

  TextField juwaa(BuildContext context) {
    return TextField(
        focusNode: _node,
        textAlign: TextAlign.justify,
        onTapOutside: (event) {
          if (event.down) {
            _node.unfocus();
          }
        },
       controller: _cont,
        decoration: const InputDecoration(
          
          hintText: "Write Message Here",
          hintStyle: TextStyle(color: Colors.grey),
          constraints: BoxConstraints(maxWidth: 320),
          fillColor: Color.fromARGB(29, 158, 158, 158),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey, width: .05)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey, width: .05)),
        ),
      );
  }
}