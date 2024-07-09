import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/getData/getdata_cubit.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/removeFromFavorite/remove_from_favorite_cubit.dart';

class Favoriteviewbody extends StatelessWidget {
  const Favoriteviewbody({super.key, required this.Data});
  final List<FavoriteModel> Data;
  @override
  Widget build(BuildContext context) {
    final FavoriteModel favoriteModel;
    var newData;
    return Scaffold(
      body: BlocConsumer<GetdataCubit, GetdataState>(
        listener: (context, state) {
          if (state is GetdataLoading) {
            helper.CustomeDialog(AppStrings.loading, Appassetes.loading);
          } else if (state is GetdataSuccess) {
            log('sssssssssssssssssssssssssssss');
          } else {
            helper.CustomeDialog(
                AppStrings.faildtoGetData, Appassetes.failureDialog);
          }
        },
        builder: (context, state) {
          return Data == [] || Data.isEmpty
              ? Center(
                  child: Text(
                    AppStrings.emptyData,
                    style: Fontstyles.titleStyle,
                  ),
                )
              : BlocConsumer<RemoveFromFavoriteCubit, RemoveFromFavoriteState>(
                  listener: (context, state) {
                    if (state is RemoveFromFavoriteLoading) {
                      helper.CustomeDialog(
                          AppStrings.loading, Appassetes.loadingDialog);
                    } else if (state is RemoveFromFavoritSuccess) {
                      helper.CustomeDialog(AppStrings.removedsuccessfully,
                          Appassetes.successDialog);
                      newData = state.Data;
                    } else {
                      helper.CustomeDialog(
                          AppStrings.faildtoRemove, Appassetes.failureDialog);
                    }
                  },
                  builder: (context, state) {
                    return GridView.builder(
                        itemCount: Data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return FavoriteContent(favoriteModel: Data[index]);
                        });
                  },
                );
        },
      ),
    );
  }
}

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
          onPressed: () {
            favoriteModel.delete();
            BlocProvider.of<RemoveFromFavoriteCubit>(context)
                .removeFavorite(favoriteModel.title);
          },
          icon: Icon(FontAwesomeIcons.trash),
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
