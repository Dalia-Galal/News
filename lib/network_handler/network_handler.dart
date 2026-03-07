import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/article_data.dart';
import 'package:news/models/source_data_model.dart';
import 'package:news/network_handler/api_constants.dart';
import 'package:news/network_handler/endpoints.dart';

class NetworkHandler {
  static Future<List<SourceData>> getAllSources(String categoryId) async {
    try {
      Map<String, dynamic> queryParameters = {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId,
      };
      final response = await http.get(
        Uri.https(ApiConstants.urlBase, Endpoints.allSources, queryParameters),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        SourceDataModel sourceDataModel = SourceDataModel.fromJson(data);
        return sourceDataModel.sources;
      } else {
        throw Exception('Something went wrong');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<ArticleData>> getAllArticles(String sourceId,int page, int pageSize) async {
    try {
      Map<String, dynamic> queryParameters = {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
        'page':page.toString(),
        'pageSize': pageSize.toString(),
      };
      final response = await http.get(
        Uri.https(ApiConstants.urlBase, Endpoints.allArticles, queryParameters),
      );
      List<ArticleData> articlesList = [];
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        for (var element in data["articles"]) {
          ArticleData articleData = ArticleData.fromJson(element);
          articlesList.add(articleData);

        }

        return articlesList;
      } else {
        throw Exception('Something went wrong');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<ArticleData>> searchInArticles(String query) async {
    try {
      Map<String, dynamic> queryParameters = {
        'apiKey': ApiConstants.apiKey,
        'q': query,
      };
      final response = await http.get(
        Uri.https(ApiConstants.urlBase, Endpoints.allArticles, queryParameters),
      );
      List<ArticleData> articlesList = [];
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        for (var element in data["articles"]) {
          ArticleData articleData = ArticleData.fromJson(element);
          articlesList.add(articleData);
        }
        return articlesList;
      } else {
        throw Exception('Something went wrong');
      }
    } catch (error) {
      throw Exception('Something went wrong');
    }
  }
}
