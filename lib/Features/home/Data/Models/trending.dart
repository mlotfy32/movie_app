class moviesModelTrending {
  final bool adult;
  final int id;
  final String backdrop_path;
  final String original_language;
  final String overview;
  final String poster_path;
  final String release_date;
  final String title;
  final String media_type;
  final dynamic vote_average;
  final dynamic vote_count;

  moviesModelTrending(
      {required this.adult,
      required this.id,
      required this.backdrop_path,
      required this.original_language,
      required this.overview,
      required this.poster_path,
      required this.release_date,
      required this.title,
      required this.vote_average,
      required this.vote_count,
      required this.media_type});

  factory moviesModelTrending.fromJson(jsonData) {
    return moviesModelTrending(
      id: jsonData['id'],
      adult: jsonData['adult'],
      backdrop_path: jsonData['backdrop_path'],
      original_language: jsonData['original_language'],
      overview: jsonData['overview'],
      poster_path: jsonData['poster_path'],
      release_date: jsonData['release_date'],
      title: jsonData['title'],
      media_type: jsonData['media_type'],
      vote_average: jsonData['vote_average'],
      vote_count: jsonData['vote_count'],
    );
  }
}

class moviesModelSoon {
  final bool adult;
  final String backdrop_path;
  final String overview;
  final String poster_path;
  final String original_title;
  final dynamic homepage;

  moviesModelSoon({
    required this.adult,
    required this.backdrop_path,
    required this.overview,
    required this.homepage,
    required this.poster_path,
    required this.original_title,
  });

  factory moviesModelSoon.fromJson(jsonData) {
    return moviesModelSoon(
        adult: jsonData['adult'],
        backdrop_path: jsonData['backdrop_path'],
        original_title: jsonData['original_title'],
        overview: jsonData['overview'],
        poster_path: jsonData['poster_path'],
        homepage: jsonData['homepage']);
  }
}
