import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_flutter_course/models/bookmarks_model.dart';
import 'package:news_app_flutter_course/models/news_model.dart';

import '../consts/api_consts.dart';

class NewsAPiServices {
  Future<List<NewsModel>> getAllNews({
    required int page,
    required String sortBy,
  }) async {
    try {
      // var url = Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=${dotenv.env['API_KEY']}');

      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": "bitcoin",
        "pageSize": "5",
        "apiKey": API_KEY,
        "page": page.toString(),
        "sortBy": sortBy,
      });
      var response = await http.get(uri, headers: {"x-Api-key": API_KEY!});
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw data['message'];
      }
      for (var v in data['articles']) {
        newsTempList.add(v);
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<NewsModel>> getTopHeadlines() async {
    try {
      var uri = Uri.https(BASEURL, "v2/top-headlines", {
        'country': 'us',
        "apiKey": API_KEY,
      });
      var response = await http.get(uri, headers: {"x-Api-key": API_KEY!});
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw data['message'];
      }
      for (var v in data['articles']) {
        newsTempList.add(v);
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<NewsModel>> searchNews({
    required String query,
  }) async {
    try {
      // var url = Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=${dotenv.env['API_KEY']}');

      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": query,
        "pageSize": "10",
        "apiKey": API_KEY,
        "domain": "techcrunch.com",
      });
      var response = await http.get(uri, headers: {"x-Api-key": API_KEY!});
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw data['message'];
      }
      for (var v in data['articles']) {
        newsTempList.add(v);
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<List<BookmarksModel>?> getBookmarks() async {
    try {
      var uri = Uri.https(BASEURL_FIREBASE!, "bookmarks.json");
      var response = await http.get(uri);

      log('Response status: ${response.statusCode}');
      log('Response status: ${response.body}');

      Map data = jsonDecode(response.body);
      List allKeys = [];

      if (data['code'] != null) {
        throw data['message'];
      }

      for(String key in data.keys) {
        allKeys.add(key);
      }
      return BookmarksModel.bookmarksFromSnapshot(json: data, allKeys: allKeys);
    } catch (error) {
      rethrow;
    }
  }
}
