import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Core/Utiles/extentions.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/Features/home/Presentation/VieewModel/imageState/get_next_image_cubit.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/PageView.dart';

class Topparthomeview extends StatelessWidget {
  Topparthomeview({super.key});

  @override
  Widget build(BuildContext context) {
    int initialImage = 1;
    return BlocProvider(
      create: (context) => GetNextImageCubit(),
      child: FutureBuilder<List<moviesModelTrending>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<moviesModelTrending> moviesData = snapshot.data!;
            return BlocConsumer<GetNextImageCubit, GetNextImageState>(
              listener: (context, state) {
                if (state is GetNextImagestate) {
                  initialImage = state.index;
                }
              },
              builder: (context, state) {
                return Stack(
                  children: [
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        height: Constants.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${Constants.UrlPath + moviesData[initialImage].backdrop_path}'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    SizedBox(
                      height: 450,
                      width: Get.width,
                      child: CustomePageview(
                        data: moviesData,
                        index: initialImage,
                      ),
                    )
                  ],
                );
              },
            );
          }
          /*
          
          */
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: ColorManager.loadingColor,
              size: 70,
            ),
          );
        },
        future: ApiService().getTrending(Constants.trendingPoint),
      ),
    );
  }
}
