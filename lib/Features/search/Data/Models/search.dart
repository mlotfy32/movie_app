class moviesModelSearch {
  final int id;
  final String backdrop_path;
  final String overview;
  final String release_date;
  final String title;
  final dynamic vote_average;
  final dynamic vote_count;

  moviesModelSearch({
    required this.id,
    required this.backdrop_path,
    required this.overview,
    required this.release_date,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });

  factory moviesModelSearch.fromJson(jsonData) {
    return moviesModelSearch(
      id: jsonData['id'] == null ? 0 : jsonData['id'],
      backdrop_path:
          jsonData['backdrop_path'] == null ? '' : jsonData['backdrop_path'],
      overview: jsonData['overview'] == null ? '' : jsonData['overview'],
      release_date:
          jsonData['release_date'] == null ? '' : jsonData['release_date'],
      title: jsonData['title'] == null ? '' : jsonData['title'],
      vote_average:
          jsonData['vote_average'] == null ? 0 : jsonData['vote_average'],
      vote_count: jsonData['vote_count'] == null ? 0 : jsonData['vote_count'],
    );
  }
}
