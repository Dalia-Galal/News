part of 'articles_cubit.dart';

sealed class ArticlesStates {}

class ArticlesInitialState extends ArticlesStates {}

class LoadGetAllArticlesState extends ArticlesStates {}

// class SuccessGetAllArticlesState extends ArticlesStates {
//   List<ArticleData>articlesList;
//
//
//   SuccessGetAllArticlesState({required this.articlesList});
// }
class ArticlesLoaded extends ArticlesStates {
  final List<ArticleData> articlesList;
  final bool hasReachedEnd;

  ArticlesLoaded({
    required this.articlesList,
    required this.hasReachedEnd,
  });
}
class ErrorGetAllArticlesState extends ArticlesStates {
  String message;

  ErrorGetAllArticlesState({required this.message});
}