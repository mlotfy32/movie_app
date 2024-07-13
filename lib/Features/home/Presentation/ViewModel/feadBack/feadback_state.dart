part of 'feadback_cubit.dart';

@immutable
abstract class FeadbackState {}

class FeadbackInitial extends FeadbackState {}

class Feadback extends FeadbackState {
  final List<int> stars;
  final bool star;
  Feadback({required this.stars, required this.star});
}
