import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Presentation/VieewModel/ChangeMovieState/changemovietype_cubit.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/CustomeDrawer.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/bottomSection.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/customeAppBar.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/topPartHomeView.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homeViewBody extends StatelessWidget {
  homeViewBody({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Customedrawer(),
      body: SizedBox(
        height: Constants.height,
        child: Stack(
          children: [
            Topparthomeview(),
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
}
