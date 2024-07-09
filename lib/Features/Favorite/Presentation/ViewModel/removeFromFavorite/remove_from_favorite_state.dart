part of 'remove_from_favorite_cubit.dart';

@immutable
abstract class RemoveFromFavoriteState {}

class RemoveFromFavoriteInitial extends RemoveFromFavoriteState {}

class RemoveFromFavoritSuccess extends RemoveFromFavoriteState {}

class RemoveFromFavoriteLoading extends RemoveFromFavoriteState {}

class RemoveFromFavoriteFailure extends RemoveFromFavoriteState {
  final String failure;

  RemoveFromFavoriteFailure({required this.failure});
}
