import 'package:flutter/material.dart';

class News_block extends StatelessWidget {
  final String image;
  final String title;
  final String news;

  const News_block({
    super.key,
    required this.image,
    required this.title,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xFF121212), borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  image,
                  width: MediaQuery.of(context).size.width / 1.1,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.25,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: const Icon(Icons.broken_image),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Text(
                  news,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
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


// category tile

class CategoryTile extends StatelessWidget {
  final  image;
  final  categoryname;
  const CategoryTile({super.key, required this.image, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(image , height: 120, width: 120,fit: BoxFit.cover,)),
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(60),),
              ),
              SizedBox(
                height: 120,
                width: 120,
                child: Align(
                  alignment: Alignment.center,
                    child: Text(categoryname,style: TextStyle(color : Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),)),
              ),
        ],
      ),
    );
  }
}