import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Core/errors/Failure.dart';
import 'package:movies_app/Features/vedioPlayer/Data/Models/video.dart';
import 'package:movies_app/Features/vedioPlayer/Data/repos/VideoRepo.dart';

class Videorepoimpl implements Videorepo {
  Dio _dio = Dio();
  @override
  Future<Either<Failure, List<moviesModelVideo>>> feachVideoMovies(
      int id) async {
    try {
      List<moviesModelVideo> moviesList = [];
      var response = await _dio.get(
          '${Constants.baseUrl}/movie/$id/videos?api_key=${Constants.apiKey}');
      var data = response.data;
      for (int i = 0; i < data['results'].length; i++) {
        moviesList.add(moviesModelVideo.fromJson(data['results'][i]));
      }
      return right(moviesList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure(e.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
