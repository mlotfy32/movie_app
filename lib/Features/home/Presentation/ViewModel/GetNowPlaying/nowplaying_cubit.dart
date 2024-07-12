import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Data/Models/nowPlaying.dart';

part 'nowplaying_state.dart';

class NowplayingCubit extends Cubit<NowplayingState> {
  NowplayingCubit() : super(NowplayingInitial());

  Future<void> getNowMovies() async {
    emit(NowplayingLoading());
    Dio _dio = Dio();
    try {
      log('${Constants.baseUrl + Constants.nowPoint + Constants.apiKey}');
      List<moviesModelNow> moviesList = [];
      var response = await _dio
          .get('${Constants.baseUrl + Constants.nowPoint + Constants.apiKey}');
      var data = response.data;
      for (int i = 0; i < data['results'].length; i++) {
        moviesList.add(moviesModelNow.fromJson(data['results'][i]));
      }
      if (moviesList.isNotEmpty && moviesList != null) {
        emit(NowplayingSuccess(Data: moviesList));
        log('${moviesList[1].poster_path}');
      } else {
        emit(NowplayingFailure());
      }
    } catch (e) {
      emit(NowplayingFailure());
    }
  }
}
