import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_about_state.dart';

class SearchAboutCubit extends Cubit<SearchAboutState> {
  SearchAboutCubit() : super(SearchAboutInitial());
  searchAbout(String search) {
    emit(SearchAbout(search: search));
  }
}
