import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter_course/models/news_model.dart';

class NewsAPiServices {
  Future<List<NewsModel>> getAllNews() async {
    var url = Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=${dotenv.env['API_KEY']}');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);
    List newsTempList = [];
    for (var v in data['articles']) {
      newsTempList.add(v);
    }
    return NewsModel.newsFromSnapshot(newsTempList);
  }
}