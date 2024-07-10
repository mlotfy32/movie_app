import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/Failure.dart';
import 'package:movies_app/Features/home/Data/Models/popular.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';

abstract class Homerepo {
  Future<Either<Failure, List<moviesModelPopular>>> feachPopularMovies(
      String endPoint);
  Future<Either<Failure, List<moviesModelTrending>>> feachTreandingMovies();
  Future<Either<Failure, List<moviesModelSoon>>> feachSoonMovies();
}
