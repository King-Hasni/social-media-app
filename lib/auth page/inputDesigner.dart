import 'package:flutter/material.dart';

// ignore: must_be_immutable
class inputer extends StatelessWidget {
  String nameOf;
  inputer({super.key , required this.nameOf});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
            constraints: BoxConstraints(maxWidth: 350, maxHeight: 45),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: .2,color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: .1), ),
                hintText: nameOf ,
                hintStyle: TextStyle(color: Colors.grey.shade400)
                ),
                cursorColor: Colors.grey,
                textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
