import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/getData/getdata_cubit.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/ChangeMovieState/changemovietype_cubit.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/CustomeDrawer.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/bottomSection.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/customeAppBar.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/topPartHomeView.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/GetNowPlaying/nowplaying_cubit.dart';

class homeViewBody extends StatefulWidget {
  homeViewBody({super.key});

  @override
  State<homeViewBody> createState() => _homeViewBodyState();
}

class _homeViewBodyState extends State<homeViewBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: BlocProvider<GetdataCubit>(
        create: (context) => GetdataCubit(),
        child: Customedrawer(),
      ),
      body: SizedBox(
        height: Constants.height,
        child: Stack(
          children: [
            BlocBuilder<NowplayingCubit, NowplayingState>(
              builder: (context, state) {
                return state is NowplayingSuccess
                    ? Topparthomeview(
                        Data: state.Data,
                      )
                    : Center(
                        child: Lottie.asset(Appassetes.loadingDialog,
                            width: Constants.width * 0.6,
                            height: Constants.height * 0.16),
                      );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Customeappbar(
                Drowerkey: _scaffoldKey,
              ),
            ),
            BlocProvider<ChangemovietypeCubit>(
              create: (context) => ChangemovietypeCubit(),
              child: Bottomsection(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<NowplayingCubit>(context).getNowMovies();
    super.initState();
  }
}
