import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/detailes/Presentation/ViewModel/addtofavorite/addtofavorite_cubit.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/removeFromFavorite/remove_from_favorite_cubit.dart';

class CustomeDetailesappbar extends StatelessWidget {
  CustomeDetailesappbar({
    super.key,
    required this.Url,
    required this.overView,
    required this.release_date,
    required this.title,
    required this.vote_average,
    required this.vote_count,
    required this.isContain,
  });
  final String Url, overView, release_date, title;
  final double vote_average;
  final int vote_count;
  final bool isContain;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    bool removed = false;
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent.withOpacity(0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: Colors.white,
                  size: 30,
                )),
            BlocConsumer<AddtofavoriteCubit, AddtofavoriteState>(
              listener: (context, state) {
                if (state is buttonFavoraitState) {
                  isFavorite = state.isFavorite;
                }
              },
              builder: (context, state) {
                return BlocConsumer<RemoveFromFavoriteCubit,
                    RemoveFromFavoriteState>(
                  listener: (context, state) {
                    if (state is RemoveFromFavoritSuccess) {
                      removed = true;
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () async {
                          if (isContain != true) {
                            BlocProvider.of<AddtofavoriteCubit>(context)
                                .addToFavorite(
                                    FavoriteModel(
                                        Poster_Url: Url,
                                        overView: overView,
                                        release_date: release_date,
                                        title: title,
                                        vote_average: vote_average,
                                        vote_count: vote_count),
                                    title);
                          }
                        },
                        icon: isContain == true && removed == false ||
                                isFavorite == true && removed == false
                            ? Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.white,
                                size: 30,
                              )
                            : Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.white,
                                size: 30,
                              ));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
