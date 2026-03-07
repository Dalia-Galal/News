import 'package:news/models/article_data.dart';
import 'package:news/models/source_data_model.dart';
import 'package:news/modules/home/repository/home_repository.dart';
import 'package:news/network_handler/network_handler.dart';

class HomeRepoImplementation implements HomeRepository
{
  @override
  Future<List<ArticleData>> getAllArticles(String sourceId,int page,int pageSize) async{
   return await NetworkHandler.getAllArticles(sourceId,page,pageSize);
  }

  @override
  Future<List<SourceData>> getAllSources(String categoryId) async{
   return await NetworkHandler.getAllSources(categoryId);
  }

  @override
  Future<List<ArticleData>> searchInArticles(String query)async {
   return await NetworkHandler.searchInArticles(query);
  }

}