import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Core/errors/Failure.dart';
import 'package:movies_app/Features/vedioPlayer/Data/Models/video.dart';
import 'package:movies_app/Features/vedioPlayer/Data/repos/VideoRepo.dart';
import 'package:movies_app/Features/vedioPlayer/Presentation/View/videoPlayer.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  getCurrentVideo(int initialVideo) {
    emit(GetCurrentVideo(currentVideo: initialVideo));
  }

  Future<void> getVideo(int id, String title) async {
    Dio _dio = Dio();
    helper.CustomeDialog(AppStrings.loading, Appassetes.loadingDialog);
    try {
      List<moviesModelVideo> moviesList = [];
      var response = await _dio.get(
          '${Constants.baseUrl}/movie/$id/videos?api_key=${Constants.apiKey}');
      var data = response.data;
      for (int i = 0; i < data['results'].length; i++) {
        moviesList.add(moviesModelVideo.fromJson(data['results'][i]));
      }
      Get.back();
      if (moviesList.isNotEmpty && moviesList != null) {
        Get.to(
            () => Videoplayer(
                  id: id,
                  title: title,
                  Data: moviesList,
                ),
            curve: Curves.bounceIn,
            duration: Duration(milliseconds: 900));
      } else {
        helper.CustomeDialog(Constants.notAvilable, Appassetes.failureDialog);
      }
    } catch (e) {
      helper.CustomeDialog(Constants.notAvilable, Appassetes.failureDialog);
    }
  }
}
