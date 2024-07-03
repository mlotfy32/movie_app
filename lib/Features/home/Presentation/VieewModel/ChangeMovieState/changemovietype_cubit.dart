import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changemovietype_state.dart';

class ChangemovietypeCubit extends Cubit<ChangemovietypeState> {
  ChangemovietypeCubit() : super(ChangemovietypeInitial());
  ChangeMovieType(int type) {
    emit(Changemovietype(type: type));
  }
}
