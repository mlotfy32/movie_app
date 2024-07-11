part of 'remove_from_favorite_cubit.dart';

@immutable
abstract class RemoveFromFavoriteState {}

class RemoveFromFavoriteInitial extends RemoveFromFavoriteState {}

class RemoveFromFavoritSuccess extends RemoveFromFavoriteState {
  final List<FavoriteModel> Data;
  final bool isEmpty;
  RemoveFromFavoritSuccess(this.isEmpty, {required this.Data});
}

class RemoveFromFavoriteLoading extends RemoveFromFavoriteState {}

class RemoveFromFavoriteFailure extends RemoveFromFavoriteState {
  final String failure;

  RemoveFromFavoriteFailure({required this.failure});
}
