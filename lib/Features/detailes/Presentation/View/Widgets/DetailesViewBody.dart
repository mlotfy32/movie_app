import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/detailes/Presentation/ViewModel/addtofavorite/addtofavorite_cubit.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/removeFromFavorite/remove_from_favorite_cubit.dart';
import 'package:movies_app/Features/detailes/Presentation/View/Widgets/CustomeAppBar.dart';

class Detailesviewbody extends StatelessWidget {
  const Detailesviewbody({
    super.key,
    required this.Url,
    required this.overView,
    required this.vote_average,
    required this.vote_count,
    required this.release_date,
    required this.title,
    required this.isContain,
  });
  final String Url, overView, release_date, title;
  final double vote_average;
  final int vote_count;
  final bool isContain;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoveFromFavoriteCubit, RemoveFromFavoriteState>(
      listener: (context, state) {
        if (state is RemoveFromFavoriteLoading) {
          helper.CustomeDialog(AppStrings.loading, Appassetes.loadingDialog);
        } else if (state is RemoveFromFavoritSuccess) {
          Get.back();
          helper.CustomeDialog(
              AppStrings.removedsuccessfully, Appassetes.successDialog);
        } else if (state is RemoveFromFavoriteFailure) {
          helper.CustomeDialog(
              AppStrings.faildtoRemove, Appassetes.failureDialog);
        }
        ;
      },
      child: Scaffold(
          body: SizedBox(
        width: Constants.width,
        child: Stack(
          children: [
            Image.network(
              '${Constants.UrlPath + Url}',
              fit: BoxFit.fitHeight,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      ColorManager.PrimaryColor.withOpacity(0.7),
                      ColorManager.PrimaryColor
                    ]),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Constants.height * 0.2, left: 10, right: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Constants.width * 0.7,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Fontstyles.titleStyle,
                      ),
                    ),
                    Text(
                      '',
                      style: Fontstyles.titleStyle
                          .copyWith(color: Colors.deepPurple),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Constants.height * 0.28, left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  release_date,
                  style: Fontstyles.titleStyle
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Constants.height * 0.66, left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  overView,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: Fontstyles.titleStyle
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: Constants.height * 0.1,
                ),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        height: 50,
                        child: BlocProvider<AddtofavoriteCubit>(
                          create: (context) => AddtofavoriteCubit(),
                          child: CustomeDetailesappbar(
                            isContain: isContain,
                            Url: Url,
                            overView: overView,
                            release_date: release_date,
                            title: title,
                            vote_average: vote_average,
                            vote_count: vote_count,
                          ),
                        )))),
          ],
        ),
      )),
    );
  }
}
