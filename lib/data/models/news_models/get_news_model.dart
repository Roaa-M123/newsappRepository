import 'package:newsapp/domain/entity/news_entity/news_entity.dart';

class NewsModel {
  final List<NewsArticleModel>? articles;

  NewsModel({required this.articles});
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      articles: (json["articles"] as List<dynamic>?)
          ?.map((element) =>
              NewsArticleModel.fromJson(element as Map<String, dynamic>))
          .toList(),
    );
  }
}

class NewsArticleModel extends NewsEntity {
  final Source? source;
  final String? author;

  final String? content;

  NewsArticleModel({
    this.source,
    this.author,
    super.url,
    this.content,
    super.title,
    super.description,
    super.publishedAt,
    super.urlToImage,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: (json['urlToImage']!=null &&json['urlToImage'].isNotEmpty)?json['urlToImage']:'https://via.placeholder.com150',
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
  NewsEntity toEntity() {
    return NewsEntity(
        publishedAt: publishedAt,
        url: url,
        title: title,
        description: description,
        urlToImage: urlToImage);
  }
  // List<NewsArticleModel> articlesFromJson(List<dynamic> jsonList) {
  //   return jsonList.map((json) => NewsArticleModel.fromJson(json)).toList();
  // }
}

class Source {
  final String? id;
  final String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
