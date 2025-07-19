import 'package:flutter/material.dart';
import 'package:taaza_khabar/ui_helpers/widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taaza khabar', style: TextStyle(fontSize: 28),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Latest News", style: TextStyle(fontSize: 19),),
          SizedBox(height: MediaQuery.of(context).size.height* 0.001,),
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             children: [
               News_block(image: "assets/images/news1.jpg",title: " The latest news is here at your tip",news: "Lorem Ipsum hisshxwhuwggwgcuhou huhuehueheh hdeuhduehde hhooeh ehd edd",),
               News_block(image: "assets/images/news1.jpg",title: " The latest news is here at your tip",news: "Lorem Ipsum hisshxwhuwggwgcuhou huhuehueheh hdeuhduehde hhooeh ehd edd",),
               News_block(image: "assets/images/news1.jpg",title: " The latest news is here at your tip",news: "Lorem Ipsum hisshxwhuwggwgcuhou huhuehueheh hdeuhduehde hhooeh ehd edd",)
             ],
           ),
         ),

        ],

      ),
    );
  }
}
