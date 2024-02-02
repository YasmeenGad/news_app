import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/showing_category_model.dart';
import '../model/slider_model.dart';

class ShowCategoryNews {
  List<ShowingCategoryModel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=cb7d52aae6f14ed9a36f6dd5bbfce846";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ShowingCategoryModel showingCategoryModelModel = ShowingCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          categories.add(showingCategoryModelModel);
        }
      });
    }
  }
}
