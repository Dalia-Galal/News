part of 'search_cubit.dart';
sealed class SearchStates {}
class SearchArticlesInitial extends SearchStates{}
class SearchArticlesLoading extends SearchStates{}

class SearchArticlesSuccess extends SearchStates{
  List<ArticleData> articleList;

  SearchArticlesSuccess({required this.articleList});
}
class SearchArticlesError extends SearchStates{
  String message;
  SearchArticlesError({required this.message});
}