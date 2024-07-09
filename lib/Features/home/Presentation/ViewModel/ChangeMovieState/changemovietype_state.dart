part of 'changemovietype_cubit.dart';

@immutable
abstract class ChangemovietypeState {}

class ChangemovietypeInitial extends ChangemovietypeState {}

class Changemovietype extends ChangemovietypeState {
  final int type;

  Changemovietype({required this.type});
}
