import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/vedioPlayer/Data/Models/video.dart';
import 'package:movies_app/Features/vedioPlayer/Presentation/View/Widgets/VideoPlayerBody.dart';
import 'package:movies_app/Features/vedioPlayer/Presentation/ViewModel/get_current_video_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoplayer extends StatelessWidget {
  const Videoplayer({super.key, required this.id, required this.title});
  final int id;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 30,
              color: Colors.white,
            ),
          ),
          title: Text(
            AppStrings.WatchTrailers,
            style: Fontstyles.titleStyle.copyWith(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<moviesModelVideo>>(
            future: ApiService().getVideo(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<moviesModelVideo> _videos = snapshot.data!;
                return BlocProvider<GetCurrentVideoCubit>(
                  create: (context) => GetCurrentVideoCubit(),
                  child: VideoPlayerBody(
                    videos: _videos,
                    title: title,
                  ),
                );
              }
              return Center(
                child: Lottie.asset(Appassetes.loadingDialog,
                    width: Constants.width * 0.6,
                    height: Constants.height * 0.17),
              );
            }));
  }
}
