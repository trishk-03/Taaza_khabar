import 'package:flutter/material.dart';
import 'package:taaza_khabar/models/article_mdel.dart';
import 'package:taaza_khabar/models/category_model.dart';
import 'package:taaza_khabar/screens/article_view.dart';
import 'package:taaza_khabar/screens/categories_news.dart';
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
    getNews();
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
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        title: const Text(
          'Taaza Khabar',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                "Explore",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesNews(
                              name: categories[index].categoryName.toString(), url: '',
                            ),
                          ),
                        );
                      },
                      child: CategoryTile(
                        image: categories[index].image,
                        categoryname: categories[index].categoryName,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Latest News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              if (loading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                      strokeWidth: 3,
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleView(
                                articleUrl: articles[index].url ?? '',
                              ),
                            ),
                          );
                        },
                        child: News_block(
                          url: articles[index].url ?? '',
                          image: articles[index].urlToImage ?? '',
                          title: articles[index].title ?? 'No Title',
                          news: articles[index].desc ?? 'No Description',
                        ),
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
