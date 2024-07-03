part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class StartAnimationState extends SplashState {
  final bool animation;
  StartAnimationState(this.animation);
}
