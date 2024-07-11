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
import 'package:movies_app/Features/vedioPlayer/Presentation/ViewModel/videoCubit/video_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoplayer extends StatelessWidget {
  const Videoplayer(
      {super.key, required this.id, required this.title, required this.Data});
  final int id;
  final String title;
  final List<moviesModelVideo> Data;
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
        body: BlocProvider<VideoCubit>(
          create: (context) => VideoCubit(),
          child: VideoPlayerBody(
            videos: Data,
            title: title,
          ),
        ));
  }
}
