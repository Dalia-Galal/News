import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/article_data.dart';
import '../../../models/source_data_model.dart';
import '../../../core/network_handler/network_handler.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  int _selectTabIndex = 0;

  List<ArticleData> _articleList = [];

  int get selectedTabIndex => _selectTabIndex;

  List<ArticleData> get articleList => _articleList;

  void setSelectedTabIndex(int index) {
    _selectTabIndex = index;
    //getAllArticles(_selectTabIndex);
    emit(ChangeSelectedTabIndex(selectedTabIndex: _selectTabIndex));
  }

  // Future<void> getAllSources(String categoryId) async {
  //   try {
  //     emit(LoadGetAllSourcesState());
  //     _sourcesList = await NetworkHandler.getAllSources(categoryId);
  //     emit(SuccessGetAllSourcesState(sourcesList:_sourcesList));
  //   } catch (e) {
  //     emit(ErrorGetAllSourcesState());
  //   }
  //   //emit(GetAllSourcesState());
  // }


}
