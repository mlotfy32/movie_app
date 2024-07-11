part of 'nowplaying_cubit.dart';

@immutable
abstract class NowplayingState {}

class NowplayingInitial extends NowplayingState {}

class NowplayingLoading extends NowplayingState {}

class NowplayingSuccess extends NowplayingState {
  final List<moviesModelNow> Data;

  NowplayingSuccess({required this.Data});
}

class NowplayingFailure extends NowplayingState {}
