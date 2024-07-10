import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Core/errors/Failure.dart';
import 'package:movies_app/Features/home/Data/Models/popular.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';
import 'package:movies_app/Features/home/Data/Repo/homeRepo.dart';

class Homerepoimpl implements Homerepo {
  final ApiService apiService;
  Dio _dio = Dio();
  String _baseUrl = 'https://api.themoviedb.org/3';
  String _apiKey = 'f33521953035af3fc3162fe1ac22e60c';
  Homerepoimpl({required this.apiService});
  @override
  Future<Either<Failure, List<moviesModelPopular>>> feachPopularMovies(
      String endPoint) async {
    try {
      List<moviesModelPopular> moviesList = [];

      var response = await _dio.get('$_baseUrl$endPoint$_apiKey');
      var data = response.data;
      for (int i = 0; i < data['results'].length; i++) {
        moviesList.add(moviesModelPopular.fromJson(data['results'][i]));
      }
      return right(moviesList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure(e.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<moviesModelSoon>>> feachSoonMovies() {
    // TODO: implement feachSoonMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<moviesModelTrending>>> feachTreandingMovies() {
    // TODO: implement feachTreandingMovies
    throw UnimplementedError();
  }
}
