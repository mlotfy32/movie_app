import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/getData/getdata_cubit.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/removeFromFavorite/remove_from_favorite_cubit.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({
    super.key,
    required this.favoriteModel,
  });

  final FavoriteModel favoriteModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          focusColor: ColorManager.PrimaryColor,
          onPressed: () {
            favoriteModel.delete();
            BlocProvider.of<RemoveFromFavoriteCubit>(context)
                .removeFavorite(favoriteModel.title);
          },
          icon: Icon(FontAwesomeIcons.trash, shadows: [
            Shadow(
              color: Colors.black,
            ),
            Shadow(
              color: Colors.red,
            )
          ]),
          color: ColorManager.titlewhite,
        ),
      ),
      margin: EdgeInsets.all(5),
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
        image: DecorationImage(
            image:
                NetworkImage('${Constants.UrlPath + favoriteModel.Poster_Url}'),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
