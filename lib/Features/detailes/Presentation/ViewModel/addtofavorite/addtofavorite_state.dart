part of 'addtofavorite_cubit.dart';

@immutable
abstract class AddtofavoriteState {}

class AddtofavoriteInitial extends AddtofavoriteState {}

class AddtofavoriteSuccess extends AddtofavoriteState {}

class AddtofavoriteLoading extends AddtofavoriteState {}

class Addtofavorite extends AddtofavoriteState {}

class isContainState extends AddtofavoriteState {
  final bool isContain;

  isContainState({required this.isContain});
}

class AddtofavoriteFailure extends AddtofavoriteState {}

class buttonFavoraitState extends AddtofavoriteState {
  final bool isFavorite;

  buttonFavoraitState({required this.isFavorite});
}

class GetfavoriteSuccess extends AddtofavoriteState {
  final List<FavoriteModel> FavoriteMovies;

  GetfavoriteSuccess({required this.FavoriteMovies});
}
