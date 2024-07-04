part of 'addtofavorite_cubit.dart';

@immutable
abstract class AddtofavoriteState {}

class AddtofavoriteInitial extends AddtofavoriteState {}

class AddtofavoriteSuccess extends AddtofavoriteState {}

class AddtofavoriteLoading extends AddtofavoriteState {}

class AddtofavoriteFailure extends AddtofavoriteState {}

class buttonFavoraitState extends AddtofavoriteState {
  final bool isFavorite;

  buttonFavoraitState({required this.isFavorite});
}

class GetfavoriteSuccess extends AddtofavoriteState {
  final List<FavoriteModel> FavoriteMovies;

  GetfavoriteSuccess({required this.FavoriteMovies});
}
