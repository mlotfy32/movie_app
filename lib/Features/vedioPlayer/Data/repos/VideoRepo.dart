import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/Failure.dart';
import 'package:movies_app/Features/vedioPlayer/Data/Models/video.dart';

abstract class Videorepo {
  Future<Either<Failure, List<moviesModelVideo>>> feachVideoMovies(int id);
}
