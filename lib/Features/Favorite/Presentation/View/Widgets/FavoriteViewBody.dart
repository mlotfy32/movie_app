import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/getData/getdata_cubit.dart';

class Favoriteviewbody extends StatelessWidget {
  const Favoriteviewbody({super.key, required this.Data});
  final List<FavoriteModel> Data;
  @override
  Widget build(BuildContext context) {
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
          return Data == []
              ? Center(
                  child: Text(
                    AppStrings.emptyData,
                    style: Fontstyles.titleStyle,
                  ),
                )
              : GridView.builder(
                  itemCount: Data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => Container(
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
                              image: NetworkImage(
                                  '${Constants.UrlPath + Data[index].Poster_Url}'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ));
        },
      ),
    );
  }
}
