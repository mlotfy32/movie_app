class moviesModelVideo {
  final String published_at;
  final String key;
  final String name;
  final String id;
  moviesModelVideo(
      {required this.key,
      required this.name,
      required this.published_at,
      required this.id});

  factory moviesModelVideo.fromJson(jsonData) {
    return moviesModelVideo(
      id: jsonData['id'],
      name: jsonData['name'],
      key: jsonData['key'],
      published_at: jsonData['published_at'],
    );
  }
}
