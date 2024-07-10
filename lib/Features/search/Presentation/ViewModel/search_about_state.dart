part of 'search_about_cubit.dart';

@immutable
abstract class SearchAboutState {}

class SearchAboutInitial extends SearchAboutState {}

class SearchAbout extends SearchAboutState {
  final String search;

  SearchAbout({required this.search});
}
