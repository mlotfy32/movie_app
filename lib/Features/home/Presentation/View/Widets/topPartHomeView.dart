import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Features/home/Data/Models/nowPlaying.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/customeAppBar.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/GetNowPlaying/nowplaying_cubit.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/checkiscontain/checkiscontain_cubit.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/imageState/get_next_image_cubit.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/PageView.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/customeDivider.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/backGroundImage.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/title.dart';

class Topparthomeview extends StatelessWidget {
  Topparthomeview({super.key, required this.Data, required this.scaffoldKey});
  final List<moviesModelNow> Data;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    int initialImage = 1;

    return BlocProvider<GetNextImageCubit>(
      create: (context) => GetNextImageCubit(),
      child: Container(
        child: BlocConsumer<GetNextImageCubit, GetNextImageState>(
          listener: (context, state) {
            if (state is GetNextImagestate) {
              initialImage = state.index;
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Backgroundimage(backdrop_path: Data[initialImage].poster_path),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.53,
                  width: Get.width,
                  child: BlocProvider<CheckiscontainCubit>(
                    create: (context) => CheckiscontainCubit(),
                    child: CustomePageview(
                      Data: Data,
                      index: initialImage,
                    ),
                  ),
                ),
                CustomeTitle(
                  titile: Data[initialImage].title,
                ),
                CustomeDivider(),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Customeappbar(
                    Drowerkey: scaffoldKey,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
