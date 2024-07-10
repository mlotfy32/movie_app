import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/detailes/Presentation/View/Widgets/actorsListView.dart';
import 'package:movies_app/Features/detailes/Presentation/View/Widgets/watchTrailerButton.dart';
import 'package:movies_app/Features/detailes/Presentation/ViewModel/addtofavorite/addtofavorite_cubit.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/removeFromFavorite/remove_from_favorite_cubit.dart';
import 'package:movies_app/Features/detailes/Presentation/View/Widgets/CustomeAppBar.dart';
import 'package:movies_app/Features/detailes/Data/Models/actors.dart';

class Detailesviewbody extends StatelessWidget {
  const Detailesviewbody({
    super.key,
    required this.Url,
    required this.overView,
    required this.id,
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
  final int id;

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
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constants.UrlPath + Url),
                    fit: BoxFit.fill),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      ColorManager.PrimaryColor.withOpacity(0.7),
                      ColorManager.PrimaryColor
                    ]),
              ),
              child: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
                SliverToBoxAdapter(
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
                      )),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Constants.height * 0.4, left: 4, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Constants.width * 0.8,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            title,
                            style: Fontstyles.titleStyle
                                .copyWith(color: ColorManager.titlewhite),
                          ),
                        ),
                        Text(
                          "$vote_average",
                          style: Fontstyles.titleStyle
                              .copyWith(color: Colors.deepPurple),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(release_date,
                        style: Fontstyles.titleStyle
                            .copyWith(color: Colors.deepPurple)),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      overView,
                      maxLines: 10,
                      style: Fontstyles.titleStyle
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ActorsList(id: id),
                ),
                SliverToBoxAdapter(
                  child: WatchTrailerButton(id: id, title: title),
                )
              ]),
            ),
          ),
        ));
  }
}
