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
                            padding:
                                EdgeInsets.only(top: Constants.height * 0.4),
                            child: Text(
                              AppStrings.typeSomething,
                              style: Fontstyles.titleStyle
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                          Lottie.asset(Appassetes.searchforData,
                              width: Constants.width * 0.6,
                              height: Constants.height * 0.17),
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

class CustomeTextForm extends StatelessWidget {
  const CustomeTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          BlocProvider.of<SearchAboutCubit>(context).searchAbout(value);
        },
        style: Fontstyles.titleStyle
            .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          suffixIcon: Icon(
            FontAwesomeIcons.search,
            color: Colors.deepPurple.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(15)),
          label: Text(
            AppStrings.search,
            style: Fontstyles.titleStyle.copyWith(
                color: Colors.deepPurple.withOpacity(0.5), fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class GetSearch extends StatelessWidget {
  const GetSearch({super.key, required this.Search});
  final String Search;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<moviesModelSearch>>(
        future: ApiService().searchAbout(Search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<moviesModelSearch> Data = snapshot.data!;
            return SearchBody(Data: Data);
          } else {
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Constants.height * 0.4),
                  child: Text(
                    AppStrings.nomOVIESfOUBD,
                    style: Fontstyles.titleStyle
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                Lottie.asset(Appassetes.failureDialog,
                    width: Constants.width * 0.6,
                    height: Constants.height * 0.17),
              ],
            );
          }
          return Center(
            child: Lottie.asset(Appassetes.loadingDialog,
                width: Constants.width * 0.6, height: Constants.height * 0.17),
          );
        });
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, required this.Data});
  final List<moviesModelSearch> Data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.height * 0.9,
      child: ListView.separated(
          itemBuilder: (context, index) => SizedBox(
                height: Constants.height * 0.15,
                child: InkWell(
                  onTap: () {
                    isContain(index);
                  },
                  child: Row(
                    children: [
                      Container(
                        height: Constants.height * 0.12,
                        width: Constants.width * 0.23,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(Constants.UrlPath +
                                    Data[index].backdrop_path),
                                fit: BoxFit.fill)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Constants.width * 0.73,
                              child: Text(
                                '  ${Data[index].title}',
                                style: Fontstyles.titleStyle.copyWith(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: Constants.width * 0.73,
                              child: Text(
                                '  ${Data[index].overview}',
                                style: Fontstyles.titleStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white60),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: Data.length),
    );
  }

  Future isContain(int index) async {
    try {
      await Hive.close();
      if (!Hive.isBoxOpen(Constants.KBox)) await Hive.openBox(Constants.KBox);
      var HiveData = await Hive.box(Constants.KBox).get(Data[index].title);

      Get.to(
          duration: Duration(milliseconds: 900),
          () => Detailesview(
                id: Data[index].id,
                isContain: HiveData == null ? false : true,
                title: Data[index].title,
                Url: Data[index].backdrop_path,
                overView: Data[index].overview,
                release_date: Data[index].release_date,
                vote_average: Data[index].vote_average,
                vote_count: Data[index].vote_count,
              ),
          curve: Curves.bounceIn);
    } catch (e) {
      log('rrrrrrrrrrrrrrr$e');
    }
  }
}
