import 'package:flutter/material.dart';

class News_block extends StatelessWidget{
  final String image;
  final String title;
  final String news;
  const News_block({super.key,required this.image,required this.title, required this.news});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(image,
                  width: MediaQuery.of(context).size.width /1.8,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
              SizedBox(height: 10),
              Text(title , style:  TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),),
              SizedBox( height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width /1.8,
                child: Text(news, style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),),
              ),
              SizedBox(height: 8.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Spacer(),
                  Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}