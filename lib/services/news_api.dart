// dddf528d0aed42ebb93f4188c74d121e
import 'dart:convert';
import 'package:taaza_khabar/models/article_mdel.dart';
import 'package:http/http.dart' as http;

class News {

  List<Article_model> news =[];

  Future<void> getNews()async{
    String url ="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=dddf528d0aed42ebb93f4188c74d121e";
    // String url ="https://newsapi.org/v2/everything?q=india&from=2025-07-28&sortBy=publishedAt&apiKey=dddf528d0aed42ebb93f4188c74d121e";


    var response = await http.get(Uri.parse(url));

    var jsonData =  jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!= null && element["description"]!=null){
          Article_model article_model = Article_model(
            urlToImage: element["urlToImage"],
            desc: element["description"],
            title: element["title"],
          );

          news.add(article_model);
        }
      });
    }
  }

}

