part of 'get_current_video_cubit.dart';

@immutable
abstract class GetCurrentVideoState {}

class GetCurrentVideoInitial extends GetCurrentVideoState {}

class GetCurrentVideo extends GetCurrentVideoState {
  final int currentVideo;

  GetCurrentVideo({required this.currentVideo});
}
