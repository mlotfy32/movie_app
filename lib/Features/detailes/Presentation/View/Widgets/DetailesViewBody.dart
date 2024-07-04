import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/addtofavorite_cubit.dart';
import 'package:movies_app/Features/detailes/Presentation/View/Widgets/CustomeAppBar.dart';

class Detailesviewbody extends StatelessWidget {
  const Detailesviewbody(
      {super.key,
      required this.Url,
      required this.overView,
      required this.vote_average,
      required this.vote_count,
      required this.release_date,
      required this.title});
  final String Url, overView, release_date, title;
  final double vote_average;
  final int vote_count;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddtofavoriteCubit, AddtofavoriteState>(
      listener: (context, state) {
        if (state is AddtofavoriteLoading) {
          return helper.CustomeDialog(
              AppStrings.loading, Appassetes.loadingDialog);
        } else if (state is AddtofavoriteSuccess) {
          return helper.CustomeDialog(
              AppStrings.success, Appassetes.successDialog);
        } else if (state is AddtofavoriteFailure) {
          return helper.CustomeDialog(
              AppStrings.faildtoSaveData, Appassetes.failureDialog);
        }
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
                    Text(
                      title,
                      style: Fontstyles.titleStyle,
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
                        child: CustomeDetailesappbar(
                          Url: Url,
                          overView: overView,
                          release_date: release_date,
                          title: title,
                          vote_average: vote_average,
                          vote_count: vote_count,
                        )))),
          ],
        ),
      )),
    );
  }
}
