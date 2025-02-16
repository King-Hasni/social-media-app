import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_media/pages/test%20dots.dart';

class home_body extends StatelessWidget {
  home_body({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
        return Column(
        children: [
          Divider(
            thickness: .5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/Profile Image (1).png",
                      scale: 1.6,
                    ),
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text("Name"),
                           Text("Address" , style: TextStyle(color: Colors.grey),)
                           ],
                      ),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Dots_test(
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
             child: RichText(text: const TextSpan(children: [
              TextSpan(text: "King Hasni",style: TextStyle(color: Colors.black,fontSize: 16 , fontWeight: FontWeight.w600)),
              TextSpan(text: "This game in japan was amazing and i want to share",style: TextStyle(color: Colors.black,fontSize: 16 ,)),
             ])),
           )
        ],
      );
      },),
    ); 
}}
