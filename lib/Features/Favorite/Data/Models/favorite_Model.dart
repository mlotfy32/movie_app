import 'package:hive/hive.dart';
part 'favorite_Model.g.dart';

@HiveType(typeId: 2)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  final String Poster_Url;
  @HiveField(1)
  final String overView;
  @HiveField(2)
  final String release_date;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final double vote_average;
  @HiveField(5)
  final int vote_count;
  FavoriteModel({
    required this.Poster_Url,
    required this.overView,
    required this.release_date,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });
}
