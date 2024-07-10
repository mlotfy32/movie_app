import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/checkiscontain/checkiscontain_cubit.dart';
import 'package:movies_app/Features/search/Data/Models/search.dart';
import 'package:movies_app/Features/search/Presentation/ViewModel/search_about_cubit.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, required this.Data});
  final List<moviesModelSearch> Data;
  @override
  Widget build(BuildContext context) {
    bool hasData = true;
    return BlocConsumer<SearchAboutCubit, SearchAboutState>(
        listener: (context, state) {
      if (state is SearcChangeState) {
        hasData = state.hasData;
      }
    }, builder: (context, state) {
      return hasData == true
          ? SizedBox(
              height: Constants.height * 0.9,
              child: ListView.separated(
                  itemBuilder: (context, index) => SizedBox(
                        height: Constants.height * 0.15,
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<CheckiscontainCubit>(context)
                                .isContain(index, Data);
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
                                            Data[index].poster_path),
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
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
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
            )
          : Column(
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
    });
  }
}
