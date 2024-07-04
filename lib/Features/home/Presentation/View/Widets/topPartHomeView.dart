import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/Features/home/Presentation/VieewModel/imageState/get_next_image_cubit.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/PageView.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/customeDivider.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/backGroundImage.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/title.dart';

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
                return Container(
                  height: Constants.height * 0.59,
                  child: Stack(
                    children: [
                      Backgroundimage(
                          backdrop_path:
                              moviesData[initialImage].backdrop_path),
                      SizedBox(
                        height: Constants.height * 0.53,
                        width: Get.width,
                        child: CustomePageview(
                          Data: moviesData,
                          index: initialImage,
                        ),
                      ),
                      CustomeTitle(
                        titile: moviesData[initialImage].title,
                      ),
                      CustomeDivider()
                    ],
                  ),
                );
              },
            );
          }

          return Center(
            child: Lottie.asset(Appassetes.loading,
                width: Constants.width * 0.6, height: Constants.height * 0.17),
          );
        },
        future: ApiService().getTrending(Constants.trendingPoint),
      ),
    );
  }
}
