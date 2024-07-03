class moviesModelPopular {
  final String original_language;
  final String overview;
  final String poster_path;
  final String title;
  final dynamic vote_average;
  final dynamic vote_count;

  moviesModelPopular({
    required this.original_language,
    required this.overview,
    required this.poster_path,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });

  factory moviesModelPopular.fromJson(jsonData) {
    return moviesModelPopular(
      original_language: jsonData['original_language'],
      overview: jsonData['overview'],
      poster_path: jsonData['poster_path'],
      title: jsonData['title'],
      vote_average: jsonData['vote_average'],
      vote_count: jsonData['vote_count'],
    );
  }
}
