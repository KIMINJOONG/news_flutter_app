import 'package:flutter/cupertino.dart';
import 'package:news_app_flutter_course/services/news_api.dart';

import '../models/news_model.dart';

class NewsProvider with ChangeNotifier{
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList {
    return newsList;
  }

  Future<List<NewsModel>> fetchAllNews() async {
    newsList = await NewsAPiServices().getAllNews();
    return newsList;
  }

}