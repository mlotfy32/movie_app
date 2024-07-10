import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_about_state.dart';

class SearchAboutCubit extends Cubit<SearchAboutState> {
  SearchAboutCubit() : super(SearchAboutInitial());
  searchAbout(String search) {
    emit(SearchAbout(search: search));
  }

  hasData(bool hasdata) {
    if (hasdata == true)
      emit(SearcChangeState(hasData: true));
    else
      emit(SearcChangeState(hasData: false));
  }
}
