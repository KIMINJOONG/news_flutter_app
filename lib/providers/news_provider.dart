import 'package:flutter/cupertino.dart';
import 'package:news_app_flutter_course/services/news_api.dart';

import '../models/news_model.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList {
    return newsList;
  }

  Future<List<NewsModel>> fetchAllNews(
      {required int pageIndex, required String sortBy}) async {
    newsList =
        await NewsAPiServices().getAllNews(page: pageIndex, sortBy: sortBy);
    return newsList;
  }

  Future<List<NewsModel>> fetchTopHeadlines() async {
    newsList = await NewsAPiServices().getTopHeadlines();
    return newsList;
  }

  NewsModel findByDate({required String publishedAt}) {
    return newsList
        .firstWhere((newsModel) => newsModel.publishedAt == publishedAt);
  }
}
