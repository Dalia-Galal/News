class ArticleData {
  final String? sourceId;
  final String sourceName;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String content;

  ArticleData({
    this.sourceId,
    required this.sourceName,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleData.fromJson(Map<String, dynamic> json) {
    return ArticleData(
      sourceId: json['source']['id'],
      sourceName: json['source']['name'],
      author: json['author'],
      title: json['title']??'No Title',
      description: json['description'],
      url: json['url']?? 'No link',
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
