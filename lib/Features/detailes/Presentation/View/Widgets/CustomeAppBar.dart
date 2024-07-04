import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/addtofavorite_cubit.dart';

class CustomeDetailesappbar extends StatelessWidget {
  CustomeDetailesappbar({
    super.key,
    required this.Url,
    required this.overView,
    required this.release_date,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });
  final String Url, overView, release_date, title;
  final double vote_average;
  final int vote_count;
  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    double opacity = 0.3;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          BlocConsumer<AddtofavoriteCubit, AddtofavoriteState>(
            listener: (context, state) {
              if (state is buttonFavoraitState) {
                isFavorite = state.isFavorite;
                opacity = 1;
              }
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    BlocProvider.of<AddtofavoriteCubit>(context)
                        .isContain('Inside Out2');
                    // .addToFavorite(
                    //     FavoriteModel(
                    //         Poster_Url: Url,
                    //         overView: overView,
                    //         release_date: release_date,
                    //         title: title,
                    //         vote_average: vote_average,
                    //         vote_count: vote_count));
                  },
                  icon: AnimatedOpacity(
                    duration: Duration(seconds: 2),
                    opacity: opacity,
                    child: isFavorite == true
                        ? Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                            size: 30,
                          )
                        : Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                            size: 30,
                          ),
                  ));
            },
          )
        ],
      ),
    );
  }
}
