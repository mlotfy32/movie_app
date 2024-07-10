import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Features/vedioPlayer/Data/Models/video.dart';
import 'package:movies_app/Features/vedioPlayer/Data/repos/VideoRepo.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  getCurrentVideo(int initialVideo) {
    emit(GetCurrentVideo(currentVideo: initialVideo));
  }

  // Future<void> feachVideoMovies(int id) async {
  //   var Data = await Videorepo.feachVideoMovies(id);
  //      Data.fold((failure) {
  //     emit(NewsetBooksFailure(failure.errMessage));
  //   }, (books) {
  //     emit(NewsetBooksSuccess(books));
  //   });
  // }
}
