import 'package:news/models/source_data_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeSelectedTabIndex extends HomeStates {
  int selectedTabIndex;

  ChangeSelectedTabIndex({required this.selectedTabIndex});
}

