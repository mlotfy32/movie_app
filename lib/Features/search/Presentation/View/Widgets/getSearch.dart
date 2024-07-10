import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/checkiscontain/checkiscontain_cubit.dart';
import 'package:movies_app/Features/search/Data/Models/search.dart';
import 'package:movies_app/Features/search/Presentation/View/Widgets/SearchViewBody.dart';
import 'package:movies_app/Features/search/Presentation/View/Widgets/searchBody.dart';
import 'package:movies_app/Features/search/Presentation/ViewModel/search_about_cubit.dart';

class GetSearch extends StatelessWidget {
  const GetSearch({super.key, required this.Search});
  final String Search;
  @override
  Widget build(BuildContext context) {
    bool hasData = true;
    return FutureBuilder<List<moviesModelSearch>>(
        future: ApiService().searchAbout(Search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<moviesModelSearch> Data = snapshot.data!;
            // if (Data.isEmpty || Data == null) {
            //   log('=====a=a=a=a=a==a=a');
            //   BlocProvider.of<SearchAboutCubit>(context).hasData(false);
            // }
            return BlocProvider<CheckiscontainCubit>(
              create: (context) => CheckiscontainCubit(),
              child: SearchBody(Data: Data),
            );
          }
          return Center(
            child: Lottie.asset(Appassetes.loadingDialog,
                width: Constants.width * 0.6, height: Constants.height * 0.17),
          );
        });
  }
}
