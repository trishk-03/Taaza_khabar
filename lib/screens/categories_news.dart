import 'package:flutter/material.dart';
import 'package:taaza_khabar/models/show_category.dart';
import '../services/show_category_news.dart';
import 'article_view.dart';

class CategoriesNews extends StatefulWidget {
  final String name;
  final String url;
  const CategoriesNews({super.key, required this.name, required this.url});

  @override
  State<CategoriesNews> createState() => _CategoriesNewsState();
}

class _CategoriesNewsState extends State<CategoriesNews> {
  List<ShowCategoryModel> categories = [];
  bool loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: loading
                    ? const Center(child: CircularProgressIndicator(color: Colors.white))
                    : ListView.builder(
                  padding: const EdgeInsets.all(24),
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(articleUrl: categories[index].url!,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                category.urlToImage ?? '',
                                width: screenWidth,
                                height: 200,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  height: 200,
                                  color: Colors.grey.shade800,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'No Image',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              category.title ?? 'No Title',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.desc ?? 'No Description',
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 15.0,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
