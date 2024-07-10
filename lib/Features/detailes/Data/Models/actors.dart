class moviesModelActoes {
  final bool adult;
  final int id;
  final String name;
  final String profile_path;
  final String character;

  moviesModelActoes(
      {required this.adult,
      required this.id,
      required this.name,
      required this.character,
      required this.profile_path});

  factory moviesModelActoes.fromJson(jsonData) {
    return moviesModelActoes(
      id: jsonData['id'],
      adult: jsonData['adult'],
      character: jsonData['character'],
      name: jsonData['name'],
      profile_path:
          jsonData['profile_path'] == null ? '' : jsonData['profile_path'],
    );
  }
}
