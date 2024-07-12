import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/detailes/Presentation/View/DetailesView.dart';
import 'package:movies_app/Features/search/Data/Models/search.dart';
import 'package:movies_app/Features/search/Presentation/View/Widgets/CustomeTextForm.dart';
import 'package:movies_app/Features/search/Presentation/View/Widgets/getSearch.dart';
import 'package:movies_app/Features/search/Presentation/ViewModel/search_about_cubit.dart';

class Searchviewbody extends StatelessWidget {
  const Searchviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    String search = '';
    return Scaffold(
        body: SafeArea(
            child: BlocConsumer<SearchAboutCubit, SearchAboutState>(
      listener: (context, state) {
        if (state is SearchAbout) {
          log('search');
          search = state.search;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom),
            child: Column(
              children: [
                CustomeTextForm(),
                search == '' || search == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height * 0.4),
                            child: Text(
                              AppStrings.typeSomething,
                              style: Fontstyles.titleStyle
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                          Lottie.asset(Appassetes.searchforData,
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: MediaQuery.sizeOf(context).height * 0.17),
                        ],
                      )
                    : GetSearch(Search: search),
              ],
            ),
          ),
        );
      },
    )));
  }
}
