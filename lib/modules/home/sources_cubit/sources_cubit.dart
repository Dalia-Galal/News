import 'package:bloc/bloc.dart';
import 'package:news/modules/home/repository/home_repository.dart';
import '../../../models/source_data_model.dart';


part 'sources_states.dart';

class SourcesCubit extends Cubit<SourcesStates> {
final HomeRepository _homeRepository;
  SourcesCubit(this._homeRepository) : super(SourcesInitialState());




  Future<void> getAllSources(String categoryId) async {
    try {
      emit(LoadGetAllSourcesState());
     var sourcesList = await _homeRepository.getAllSources( categoryId);
      emit(SuccessGetAllSourcesState(sourcesList:sourcesList));
    } catch (e) {
      emit(ErrorGetAllSourcesState(message: e.toString()));
    }
    //emit(GetAllSourcesState());
  }


}