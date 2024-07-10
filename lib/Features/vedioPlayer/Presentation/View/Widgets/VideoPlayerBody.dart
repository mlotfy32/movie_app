import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/vedioPlayer/Data/Models/video.dart';
import 'package:movies_app/Features/vedioPlayer/Presentation/ViewModel/get_current_video_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerBody extends StatefulWidget {
  VideoPlayerBody({super.key, required this.videos, required this.title});
  final List<moviesModelVideo> videos;
  final String title;
  @override
  State<VideoPlayerBody> createState() => _VideoPlayerBodyState();
}

class _VideoPlayerBodyState extends State<VideoPlayerBody> {
  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    int initialVideo = 0;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: true,
        progressIndicatorColor: ColorManager.PrimaryColor,
        progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
      builder: (context, player) {
        return Column(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                maxLines: 2,
                widget.title,
                style: Fontstyles.titleStyle.copyWith(color: Colors.deepPurple),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                        children: widget.videos.asMap().entries.map((e) {
                      int index = e.key;
                      return Column(
                        children: [
                          BlocConsumer<GetCurrentVideoCubit,
                              GetCurrentVideoState>(
                            listener: (context, state) {
                              if (state is GetCurrentVideo) {
                                initialVideo = state.currentVideo;
                              }
                            },
                            builder: (context, state) {
                              return Container(
                                height: 80,
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: InkWell(
                                  onTap: () {
                                    log('======$index');
                                    BlocProvider.of<GetCurrentVideoCubit>(
                                            context)
                                        .getCurrentVideo(index);
                                    _controller.load(widget.videos[index].key);
                                    _controller.play();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    color: initialVideo == index
                                        ? Colors.white30
                                        : Colors.transparent,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          width: Constants.width * 0.23,
                                          imageUrl: YoutubePlayer.getThumbnail(
                                            videoId: widget.videos[index].key,
                                            quality: ThumbnailQuality.high,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: SizedBox(
                                            width: Constants.width * 0.7,
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              widget.videos[index].name,
                                              style: Fontstyles.titleStyle
                                                  .copyWith(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Divider(
                            color: Colors.deepPurple.withOpacity(0.3),
                          )
                        ],
                      );
                    }).toList()),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videos[0].key,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }
}
