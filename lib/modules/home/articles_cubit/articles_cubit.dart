import 'package:bloc/bloc.dart';
import 'package:news/models/source_data_model.dart';
import 'package:news/modules/home/repository/home_repository.dart';

import '../../../models/article_data.dart';
import '../../../network_handler/network_handler.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesStates> {
  final HomeRepository _homeRepository;
  int currentPage = 1;
  final int pageSize = 5;
  bool isLoading = false;
  List<ArticleData> articles = [];

  ArticlesCubit(this._homeRepository) : super(ArticlesInitialState());

  Future<void> getAllArticles(String sourceId) async {
    if (isLoading) return;
    isLoading = true;
    if(articles.isEmpty){
      emit(LoadGetAllArticlesState());
    }


    try {
      List<ArticleData> newArticles = await _homeRepository.getAllArticles(
        sourceId,
        currentPage,
        pageSize,
      );

      articles.addAll(newArticles);
      bool hasReachedEnd = newArticles.length < pageSize;
      emit(
        ArticlesLoaded(articlesList:articles, hasReachedEnd: hasReachedEnd),
      );
      if (!hasReachedEnd) currentPage++;

    } catch (e) {
      emit(ErrorGetAllArticlesState(message: e.toString()));
    } finally {
      isLoading = false;
    }
  }

  void reset() {
    articles.clear();
    currentPage = 1;
    isLoading = false;
    emit(ArticlesInitialState());
  }
}
