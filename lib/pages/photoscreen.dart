import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/image%20picker/imageHandler.dart';

class photo extends StatefulWidget {
  const photo({super.key});

  @override
  State<photo> createState() => _photoState();
}

class _photoState extends State<photo> {
  bool gotoFile = false;
  FocusNode _node = FocusNode();
  String _pickedImage = "";
  String des = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoFile = false;
    des = "";
    _pickedImage = "";
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _node.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return gotoFile == false ? Center(child: IconButton(onPressed:  () async{
      await image_Handler.instance.pickImage().then((value) {
        setState(() {
          _pickedImage = value;
          gotoFile = true;
        });
      },);
      
    } , icon: Icon(Icons.add),),): Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 140),
        SizedBox(height: 300 , width: 300,
        child: Image.file(File(_pickedImage) , fit: BoxFit.cover , alignment: Alignment.center,),),
        SizedBox(height: 30,),
        TextField(
          focusNode: _node,
          textAlign: TextAlign.justify,
          onTapOutside: (event) {
            if (event.down) {
              _node.unfocus();
            }
          },
          onChanged: (value) => des = value,
          decoration: const InputDecoration(
           
            hintText: "Write down descrip....",
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
        ),
        SizedBox(height: 170,),
        Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border(),
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlue
          ),
          child: TextButton(onPressed: ()async{
            final le = await FirebaseFirestore.instance.collection("posts").where("uid" , isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).get();
            //print(le.docs.first.data());
            if(le.docs.isNotEmpty ){
              final gg = le.docs.first.data();
            if(gg.containsValue(FirebaseAuth.instance.currentUser!.uid.toString())){
              await image_Handler.instance.uploadProfile(_pickedImage).then((value) async {
              await FirebaseFirestore.instance.collection("posts").doc(le.docs.first.id).update({
                "uid" : FirebaseAuth.instance.currentUser!.uid.toString(),
              }).whenComplete(() async{
              await FirebaseFirestore.instance.collection("posts").doc(le.docs.first.id).collection("all").add({
                "pic" : value,
                "des" : des,

              });
              print("hmm, hogya bhai ho gya upload mojooda mein");
            },);
            },);
            }
            else{
              await image_Handler.instance.uploadProfile(_pickedImage).then((value) async {
              await FirebaseFirestore.instance.collection("posts").add({
                "uid" : FirebaseAuth.instance.currentUser!.uid.toString(),
              }).whenComplete(()async{
                var lelo = await FirebaseFirestore.instance.collection("posts").where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).get();
                
              await FirebaseFirestore.instance.collection("posts").doc(lelo.docs.first.id).collection("all").add({
                "pic" : value,
                "des" : des,

              });
              print("hmm, hogya bhai ho gya new mein");
            },);
            },);
            }
            }else{
              await image_Handler.instance.uploadProfile(_pickedImage).then((value) async {
              await FirebaseFirestore.instance.collection("posts").add({
                "uid" : FirebaseAuth.instance.currentUser!.uid.toString(),
              }).whenComplete(()async{
                var lelo = await FirebaseFirestore.instance.collection("posts").where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).get();
                
              await FirebaseFirestore.instance.collection("posts").doc(lelo.docs.first.id).collection("all").add({
                "pic" : value,
                "des" : des,
                "createdAt" : Timestamp.now()

              }).whenComplete(() {
                setState(() {
      gotoFile = false;
    des = "";
    _pickedImage = "";

    });
              },);
              print("hmm, hogya bhai ho gya new mein");
              
            },);
            },);
            }
            
            
            
    

          }, child: Text("Share" , style: TextStyle(color: Colors.white , fontSize: 20),) , )),
    ],);
  }
}