import 'package:movies_app/Features/home/Data/Models/trending.dart';

class moviesModelSoon {
  final String original_title;
  final String overview;
  final String poster_path;
  final double vote_average;
  final double vote_count;
  moviesModelSoon({
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.vote_average,
    required this.vote_count,
  });
  factory moviesModelSoon.fromJson(jsonData) {
    return moviesModelSoon(
        original_title: jsonData['original_title'],
        overview: jsonData['overview'],
        poster_path: jsonData['poster_path'],
        vote_average: jsonData['vote_average'],
        vote_count: jsonData['vote_count']);
  }
}
