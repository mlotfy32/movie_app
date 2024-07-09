class moviesModelPopular {
  final int id;
  final String original_language;
  final String overview;
  final String poster_path;
  final String title;
  final dynamic vote_average;
  final dynamic vote_count;
  final String release_date;
  moviesModelPopular(
      {required this.original_language,
      required this.id,
      required this.overview,
      required this.poster_path,
      required this.title,
      required this.vote_average,
      required this.vote_count,
      required this.release_date});

  factory moviesModelPopular.fromJson(jsonData) {
    return moviesModelPopular(
      id: jsonData['id'],
      original_language: jsonData['original_language'],
      overview: jsonData['overview'],
      poster_path: jsonData['poster_path'],
      title: jsonData['title'],
      vote_average: jsonData['vote_average'],
      vote_count: jsonData['vote_count'],
      release_date: jsonData['release_date'],
    );
  }
}
