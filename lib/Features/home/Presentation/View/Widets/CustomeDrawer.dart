import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/getData/getdata_cubit.dart';
import 'package:movies_app/Features/Favorite/Presentation/View/favorite.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/movieContainer.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/draweranimation/draweranimation_cubit.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/feadBack/feadback_cubit.dart';

class Customedrawer extends StatelessWidget {
  Customedrawer({super.key});
  double scale = 0.1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height,
      color: ColorManager.PrimaryColor.withOpacity(0.8),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          BlocConsumer<DraweranimationCubit, DraweranimationState>(
            builder: (context, state) => AnimatedScale(
                duration: Duration(seconds: 1),
                scale: scale,
                child: Image.asset(Appassetes.LogoSplash)),
            listener: (context, state) {
              if (state is DraweranimationStart) {
                scale = 1;
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: MovieContainer())
        ],
      ),
    );
  }
}
