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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<NowplayingCubit, NowplayingState>(
            builder: (context, state) {
              return state is NowplayingSuccess
                  ? Container(
                      // color: Colors.red,
                      height: MediaQuery.sizeOf(context).height * 0.58,
                      child: Topparthomeview(
                        scaffoldKey: _scaffoldKey,
                        Data: state.Data,
                      ),
                    )
                  : Container(
                      height: MediaQuery.sizeOf(context).height * 0.58,
                      alignment: Alignment.center,
                      child: Lottie.asset(Appassetes.loadingDialog,
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: MediaQuery.sizeOf(context).height * 0.2));
            },
          ),
          BlocProvider<ChangemovietypeCubit>(
            create: (context) => ChangemovietypeCubit(),
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.42,
                child: Bottomsection()),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<NowplayingCubit>(context).getNowMovies();
    super.initState();
  }
}
