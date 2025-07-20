import 'package:flutter/material.dart';
import 'package:taaza_khabar/models/article_mdel.dart';
import 'package:taaza_khabar/models/category_model.dart';
import 'package:taaza_khabar/services/data.dart';
import 'package:taaza_khabar/services/news_api.dart';
import 'package:taaza_khabar/ui_helpers/widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<CategoryModel> categories = [];
  List<Article_model> articles = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategory();
    getNews(); // Call API here
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Taaza Khabar',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Explore",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.purple),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image,
                      categoryname: categories[index].categoryName,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Latest News",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.purple),
              ),
              const SizedBox(height: 10),
              if (loading) const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              else Expanded(
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return News_block(
                      image: articles[index].urlToImage ?? '',
                      title: articles[index].title ?? 'No Title',
                      news: articles[index].desc ?? 'No Description',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


