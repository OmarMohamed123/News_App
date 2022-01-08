import 'dart:convert';
import 'package:news_app/model/newsModel.dart';
import 'package:http/http.dart' as http;

class Api {
  static List<NewsModel> news = [];
 // static String oldAPIKey = "3bf354eb490b47bc87590f15f86a69f9";
  static String APIKey = "6bb626d4e4b54531ac98d23b15ca8cef";
  static String country="eg";
  static Future<List<NewsModel>> fetchNews(String postType) async {
    String CompleteLink="https://newsapi.org/v2/top-headlines?country=$country$postType&apiKey=$APIKey";
    news.clear();
    var url = Uri.parse(CompleteLink);
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["articles"];
   // print(responseBody);
    for (var x in responseBody) {
      NewsModel i = NewsModel(
          description: "${x["description"]}",
          url: "${x["url"]}",
          title: "${x["title"]}",
          urlToImage: "${x["urlToImage"]}");
      news.add(i);
    }
    return news;
  }

  static Future<List<NewsModel>> searchNews(String postType) async {
    String CompleteLink="https://newsapi.org/v2/top-headlines?$postType&apiKey=$APIKey";
    news.clear();
    var url = Uri.parse(CompleteLink);
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["articles"];
    // print(responseBody);
    for (var x in responseBody) {
      NewsModel i = NewsModel(
          description: "${x["description"]}",
          url: "${x["url"]}",
          title: "${x["title"]}",
          urlToImage: "${x["urlToImage"]}");
      news.add(i);
    }
    return news;
  }
}
