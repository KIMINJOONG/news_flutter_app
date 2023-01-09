import 'package:flutter/foundation.dart';

class BookmarksModel with ChangeNotifier {
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

  BookmarksModel({
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

  factory BookmarksModel.fromJson(dynamic json) {
    return BookmarksModel(
        newsId: json['newsId'] ?? "",
        sourceName: json['sourceName'] ?? "",
        authorName: json['authorName'] ?? "",
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        url: json['url'] ?? "",
        urlToImage: json['urlToImage'] ??
            'https://imgnews.pstatic.net/image/009/2022/12/06/0005055868_001_20221206095501034.jpg?type=w647',
        publishedAt: json['publishedAt'] ?? "",
        content: json['content'] ?? "",
        dateToShow: json['publishedAt'] ?? "",
        readingTimeText: json['readingTimeText'] ?? "");
  }

  static List<BookmarksModel> bookmarksFromSnapshot(List newSnapshot) {
    return newSnapshot.map((e) {
      return BookmarksModel.fromJson(e);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["newsId"] = newsId;
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

  @override
  String toString() {
    return 'BookmarksModel{newsId: $newsId, sourceName: $sourceName, authorName: $authorName, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, dateToShow: $dateToShow, content: $content, readingTimeText: $readingTimeText}';
  }
}
