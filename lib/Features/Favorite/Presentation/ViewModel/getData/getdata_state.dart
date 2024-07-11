part of 'getdata_cubit.dart';

@immutable
abstract class GetdataState {}

class GetdataInitial extends GetdataState {}

class GetdataLoading extends GetdataState {}

class GetdataSuccess extends GetdataState {
  final List FavoriteMovies;

  GetdataSuccess({required this.FavoriteMovies});
}

class GetdataFailure extends GetdataState {
  final String failure;

  GetdataFailure({required this.failure});
}
