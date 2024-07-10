part of 'search_about_cubit.dart';

@immutable
abstract class SearchAboutState {}

class SearchAboutInitial extends SearchAboutState {}

class SearcChangeState extends SearchAboutState {
  final bool hasData;

  SearcChangeState({required this.hasData});
}

class SearchAbout extends SearchAboutState {
  final String search;

  SearchAbout({required this.search});
}
