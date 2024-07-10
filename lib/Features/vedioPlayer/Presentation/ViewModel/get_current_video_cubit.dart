import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_current_video_state.dart';

class GetCurrentVideoCubit extends Cubit<GetCurrentVideoState> {
  GetCurrentVideoCubit() : super(GetCurrentVideoInitial());
  getCurrentVideo(int initialVideo) {
    emit(GetCurrentVideo(currentVideo: initialVideo));
  }
}
