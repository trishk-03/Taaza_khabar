import 'package:flutter/material.dart';
import 'package:taaza_khabar/models/category_model.dart';
import 'package:taaza_khabar/services/data.dart';
import 'package:taaza_khabar/ui_helpers/widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  List<CategoryModel> categories =[];

  @override
  void initState() {
    categories =getCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taaza khabar', style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Explore Section
            SizedBox(height: MediaQuery.of(context).size.height* 0.01,),
            Text(" Explore", style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.purple),),
            SizedBox(height: MediaQuery.of(context).size.height* 0.03,),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context,index){
                    return CategoryTile(image: categories[index].image, categoryname: categories[index].categoryName);
                  }),
            ),


            // Latest news section

            SizedBox(height: MediaQuery.of(context).size.height* 0.01,),
            Text("Latest News", style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.purple),),
            SizedBox(height: MediaQuery.of(context).size.height* 0.01,),
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
      ),
    );
  }
}
