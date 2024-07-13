import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/vedioPlayer/Data/Models/video.dart';
import 'package:movies_app/Features/vedioPlayer/Presentation/View/videoPlayer.dart';
import 'package:movies_app/Features/vedioPlayer/Presentation/ViewModel/videoCubit/video_cubit.dart';

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({
    super.key,
    required this.id,
    required this.title,
  });
  final int id;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<VideoCubit>(context).getVideo(id, title);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        width: MediaQuery.sizeOf(context).width > 500
            ? MediaQuery.sizeOf(context).width * 0.5
            : MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.06,
        child: Center(
          child: Text(
            AppStrings.WatchTrailer,
            style: Fontstyles.titleStyle,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.deepPurpleAccent])),
      ),
    );
  }
}
