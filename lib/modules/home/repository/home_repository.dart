import 'package:news/models/article_data.dart';
import 'package:news/models/source_data_model.dart';

abstract class HomeRepository {
  Future<List<SourceData>> getAllSources (String categoryId);
  Future<List<ArticleData>> getAllArticles (String sourceId,int page,int pageSize);
Future<List<ArticleData>> searchInArticles(String query);
}