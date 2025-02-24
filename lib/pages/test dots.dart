import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dots_test extends StatefulWidget {
  PageController controller = PageController(initialPage: 0);
  final String imageLink;
  Dots_test({super.key , required this.controller , required this.imageLink});

  @override
  State<Dots_test> createState() => _Dots_testState();
}

class _Dots_testState extends State<Dots_test> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          width: double.maxFinite,
          child: PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              print('wow');
            },
            controller: widget.controller,
            children: [
              Image.network(
                widget.imageLink,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        
      ],
    );
  }
}
