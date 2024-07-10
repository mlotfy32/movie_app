import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/draweranimation/draweranimation_cubit.dart';
import 'package:movies_app/Features/search/Presentation/View/SearchView.dart';

class Customeappbar extends StatelessWidget {
  Customeappbar({super.key, required this.Drowerkey});
  final Drowerkey;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: SvgPicture.asset(Appassetes.menu),
          onPressed: () {
            BlocProvider.of<DraweranimationCubit>(context).StartScale();
            Drowerkey.currentState?.openDrawer();
          },
        ),
        Text(
          AppStrings.title,
          style: Fontstyles.title,
        ),
        IconButton(
          onPressed: () {
            log('message');
            Get.to(() => Searchview(),
                curve: Curves.bounceIn, duration: Duration(milliseconds: 900));
          },
          icon: Icon(FontAwesomeIcons.search),
          color: ColorManager.titlewhite,
          iconSize: 27,
        )
      ],
    );
  }
}
