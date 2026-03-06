part of 'sources_cubit.dart';

sealed class SourcesStates {}
class SourcesInitialState extends SourcesStates {}

class LoadGetAllSourcesState extends SourcesStates {}

class SuccessGetAllSourcesState extends SourcesStates {
  List<SourceData> sourcesList;

  SuccessGetAllSourcesState({required this.sourcesList});
}

class ErrorGetAllSourcesState extends SourcesStates {
  String message;
  ErrorGetAllSourcesState({required this.message});
}