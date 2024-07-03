import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Data/Models/popular.dart';
import 'package:movies_app/Features/home/Presentation/VieewModel/ChangeMovieState/changemovietype_cubit.dart';

class Bottomsection extends StatelessWidget {
  const Bottomsection({super.key});

  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;
    return Container(
      margin: EdgeInsets.only(top: Constants.height * 0.59),
      width: Constants.width,
      height: Constants.height * 0.41,
      child: FutureBuilder<List<moviesModelPopular>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<moviesModelPopular> moviesDataPop = snapshot.data!;
            return BlocConsumer<ChangemovietypeCubit, ChangemovietypeState>(
              listener: (context, state) {
                if (state is Changemovietype) initialIndex = state.type;
              },
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(height: 47, child: CustomeTextButton()),
                    SizedBox(
                      height: Constants.height * 0.35,
                      child: CustomeListView(
                        // Data:initialIndex==0? moviesDataPop:initialIndex==1moviesDatasoon?:moviesDataTrend,

                        Data: moviesDataPop,
                      ),
                    ),
                  ],
                );
              },
            );
          }

          return Center(
            child: Lottie.asset(Appassetes.loading,
                width: Constants.width * 0.6, height: Constants.height * 0.16),
          );
        },
        future: ApiService().getPopular(Constants.popularPoint),
      ),
    );
  }
}

class CustomeListView extends StatelessWidget {
  const CustomeListView({super.key, required this.Data});
  final List<moviesModelPopular> Data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: Data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 3, left: 5, right: 5, bottom: 0),
                  width: Constants.width * 0.45,
                  height: Constants.height * 0.30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
                              '${Constants.UrlPath + Data[index].poster_path}'),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: Constants.width * 0.45,
                  height: 35,
                  child: Text(
                    textAlign: TextAlign.center,
                    Data[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: Fontstyles.titleStyle.copyWith(fontSize: 20),
                  ),
                )
              ],
            ));
  }
}

class CustomeTextButton extends StatelessWidget {
  const CustomeTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: Constants.moviesTypes.asMap().entries.map((e) {
          int index = e.key;
          return TextButton(
              onPressed: () {},
              child: initialIndex == index
                  ? AnimatedScale(
                      duration: Duration(milliseconds: 800),
                      scale: 1,
                      child: Column(
                        children: [
                          Text(
                            Constants.moviesTypes[index],
                            style: Fontstyles.titleStyle.copyWith(fontSize: 19),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(colors: [
                                  Colors.blue,
                                  Colors.deepPurpleAccent
                                ])),
                            width: Constants.width * 0.25,
                            height: 3,
                          ),
                        ],
                      ),
                    )
                  : Text(
                      Constants.moviesTypes[index],
                      style: Fontstyles.titleStyle.copyWith(fontSize: 18),
                    ));
        }).toList());
  }
}

List<String> title = ['Balance', 'Income', 'Expenses'];
