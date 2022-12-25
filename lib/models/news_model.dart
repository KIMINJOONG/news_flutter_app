import 'package:reading_time/reading_time.dart';

class NewsModel {
  String newsId,
      sourceName,
      authorName,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      dateToShow,
      content,
      readingTimeText;

  NewsModel({
    required this.newsId,
    required this.sourceName,
    required this.authorName,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.dateToShow,
    required this.content,
    required this.readingTimeText,
  });

  factory NewsModel.fromJson(dynamic json) {
    String title = json['title'] ?? "";
    String content = json['content'] ?? "";
    String description = json['description'] ?? "";
    return NewsModel(
      newsId: json['source']['id'] ?? "",
      sourceName: json['source']['name'] ?? "",
      authorName: json['author'] ?? "",
      title: title,
      description: description,
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ??
          'https://imgnews.pstatic.net/image/009/2022/12/06/0005055868_001_20221206095501034.jpg?type=w647',
      publishedAt: json['publishedAt'] ?? "",
      content: content,
      dateToShow: "dateToShow",
      readingTimeText: readingTime(title + description + content).msg,
    );
  }

  static List<NewsModel> newsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["NewsId"] = newsId;
    data["sourceName"] = sourceName;
    data["authorName"] = authorName;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["dateToShow"] = dateToShow;
    data["content"] = content;
    data["readingTimeText"] = readingTimeText;
    return data;
  }
}
