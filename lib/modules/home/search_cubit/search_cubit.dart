import 'package:bloc/bloc.dart';
import 'package:news/models/article_data.dart';

import '../repository/home_repository.dart';
part 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final HomeRepository _homeRepository;
  SearchCubit(this._homeRepository) : super(SearchArticlesInitial());

  Future<void> searchInArticles(String query) async {
    try {
      emit(SearchArticlesLoading());
      var articleList = await _homeRepository.searchInArticles(query);
      emit(SearchArticlesSuccess(articleList: articleList));
    } catch (e) {
      emit(SearchArticlesError(message: e.toString()));
    }
  }
}
