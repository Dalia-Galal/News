import 'package:bloc/bloc.dart';
import 'package:news/models/source_data_model.dart';
import 'package:news/modules/home/repository/home_repository.dart';

import '../../../models/article_data.dart';
import '../../../network_handler/network_handler.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesStates>{
final HomeRepository _homeRepository;
  ArticlesCubit(this._homeRepository):super (ArticlesInitialState());



  Future<void> getAllArticles(String sourceId) async {
    try {
      emit(LoadGetAllArticlesState());
     var articleList = await _homeRepository.getAllArticles(
        sourceId,
      );
      emit(SuccessGetAllArticlesState(articlesList: articleList));
    } catch (e) {
      emit(ErrorGetAllArticlesState(message: e.toString()));
    }

}

}