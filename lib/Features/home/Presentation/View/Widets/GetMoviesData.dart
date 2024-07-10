import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/ChangeMovieState/changemovietype_cubit.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/CustomeButton.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/CustomeListView.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/checkiscontain/checkiscontain_cubit.dart';

class GetMovieData extends StatelessWidget {
  const GetMovieData({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;
    return BlocConsumer<ChangemovietypeCubit, ChangemovietypeState>(
      listener: (context, state) {
        if (state is Changemovietype) {
          initialIndex = state.type;
        }
      },
      builder: (context, state) {
        return FutureBuilder<List>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List moviesDataPop = snapshot.data!;
              return Column(
                children: [
                  SizedBox(
                      height: 47,
                      child: CustomeTextButton(
                        initialIndex: initialIndex,
                      )),
                  SizedBox(
                    height: Constants.height * 0.35,
                    child: BlocProvider<CheckiscontainCubit>(
                      create: (context) => CheckiscontainCubit(),
                      child: CustomeListView(
                        id: moviesDataPop,
                        Data: moviesDataPop,
                      ),
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: Lottie.asset(Appassetes.loadingDialog,
                  width: Constants.width * 0.6,
                  height: Constants.height * 0.16),
            );
          },
          future: initialIndex == 1
              ? ApiService().getPopular(Constants.popularPoint)
              : initialIndex == 0
                  ? ApiService().getSoon(Constants.soonPoint)
                  : ApiService().getTrending(Constants.trendingPoint),
        );
      },
    );
  }
}
