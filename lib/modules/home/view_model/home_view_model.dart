
import 'package:flutter/cupertino.dart';
import 'package:news/models/article_data.dart';
import 'package:news/models/source_data_model.dart';
import 'package:news/core/network_handler/network_handler.dart';

class HomeViewModel extends ChangeNotifier{

  int _selectTabIndex = 0;
  List<SourceData> _sourcesList=[];
  List<ArticleData> _articleList=[];

  int get selectedTabIndex=>_selectTabIndex;
  List<SourceData> get sourceList => _sourcesList;
  List<ArticleData> get articleList=> _articleList;

  void setSelectedTabIndex(int index){
    _selectTabIndex =index;
    //getAllArticles();
    notifyListeners();
  }

 Future<void>getAllSources(String categoryId)async{
  try {
      _sourcesList = await NetworkHandler.getAllSources(categoryId);
      notifyListeners();
    }
  catch(e){}
  }
  // Future<void>getAllArticles()async{
  //   try {
  //     _articleList = await NetworkHandler.getAllArticles(_sourcesList[_selectTabIndex].id,1,10);
  //     notifyListeners();
  //   }
  //   catch(e){}
  // }
}