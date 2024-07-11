part of 'video_cubit.dart';

@immutable
abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoSuccess extends VideoState {
  final List<moviesModelVideo> Data;

  VideoSuccess({required this.Data});
}

class VideoLoading extends VideoState {}

class VideoFailure extends VideoState {}

class GetCurrentVideo extends VideoState {
  final int currentVideo;

  GetCurrentVideo({required this.currentVideo});
}
