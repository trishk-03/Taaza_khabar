import 'dart:convert';
import 'package:taaza_khabar/models/show_category.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories =[];

  Future<void> getCategoryNews(String category) async{
    String url ="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=dddf528d0aed42ebb93f4188c74d121e";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!= null && element["description"]!=null){
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            urlToImage: element["urlToImage"],
            desc: element["description"],
            title: element["title"],
          );

          categories.add(showCategoryModel);
        }
      });
    }
  }
}