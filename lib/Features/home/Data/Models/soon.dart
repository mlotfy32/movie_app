class moviesModelSoon {
  final bool adult;
  final int id;
  final String backdrop_path;
  final String overview;
  final String poster_path;
  final String original_title;
  final dynamic homepage;
  final String release_date;

  moviesModelSoon(
      {required this.adult,
      required this.id,
      required this.backdrop_path,
      required this.overview,
      required this.homepage,
      required this.poster_path,
      required this.original_title,
      required this.release_date});

  factory moviesModelSoon.fromJson(jsonData) {
    return moviesModelSoon(
      id: jsonData['id'],
      adult: jsonData['adult'],
      backdrop_path: jsonData['backdrop_path'],
      original_title: jsonData['original_title'],
      overview: jsonData['overview'],
      poster_path: jsonData['poster_path'],
      homepage: jsonData['homepage'],
      release_date: jsonData['release_date'],
    );
  }
}
