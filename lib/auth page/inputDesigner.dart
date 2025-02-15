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
            border: OutlineInputBorder(
              borderSide: BorderSide(width: .1, color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: .1), ),
                hintText: nameOf
                ),
                cursorColor: Colors.grey,
                textAlignVertical: TextAlignVertical.top,
      ),
    );
  }
}
