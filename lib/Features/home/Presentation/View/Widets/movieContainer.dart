import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/Functions.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Presentation/View/favorite.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/feadBack/feadback_cubit.dart';
import 'package:movies_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Constants.titleMove.length,
      itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.only(left: 8),
          height: MediaQuery.sizeOf(context).height * 0.07,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.PrimaryColor),
          child: InkWell(
            child: ListTile(
              title: Text(
                textAlign: TextAlign.center,
                Constants.titleMove[index],
                overflow: TextOverflow.clip,
                style: Fontstyles.drawerItems,
              ),
              trailing: Constants.icons[index],
            ),
            onTap: () async {
              Object? isfeadBack = await feadBack!.get('feadBack');
              if (index == 0)
                Get.to(() => Favorite(),
                    curve: Curves.bounceIn,
                    duration: Duration(milliseconds: 900));
              else if (index == 1) {
                isfeadBack == null
                    ? Get.defaultDialog(
                        titlePadding: EdgeInsets.all(10),
                        backgroundColor: ColorManager.PrimaryColor,
                        title: AppStrings.feadBack,
                        titleStyle: Fontstyles.titleStyle,
                        content: Center(
                            child: BlocProvider<FeadbackCubit>(
                          create: (context) => FeadbackCubit(),
                          child: FeadBack(),
                        )))
                    : helper.CustomeDialog(
                        AppStrings.feadBackWassent, Appassetes.failureDialog);
              } else {
                await launch(AppStrings.gitHupLinh);
              }
            },
          )),
    );
  }
}

class FeadBack extends StatelessWidget {
  const FeadBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<int> Stars = [];
    bool stars = false;
    return BlocConsumer<FeadbackCubit, FeadbackState>(
      listener: (context, state) {
        if (state is Feadback) {
          Stars = state.stars;
          stars = state.star;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 78,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => IconButton(
                    onPressed: () {
                      BlocProvider.of<FeadbackCubit>(context).stars(index);
                    },
                    icon: Stars.contains(index)
                        ? SvgPicture.asset(
                            Appassetes.star,
                            width: 50,
                            height: 30,
                          )
                        : Icon(FontAwesomeIcons.star)),
                itemCount: 5,
              ),
            ),
            TextButton(
                onPressed: stars == false
                    ? null
                    : () async {
                        Get.back();
                        Get.snackbar('', '',
                            margin: EdgeInsets.all(10),
                            backgroundColor: ColorManager.PrimaryColor,
                            titleText: Text(
                              AppStrings.title,
                              style: Fontstyles.title.copyWith(fontSize: 30),
                            ),
                            messageText: Text(
                              AppStrings.sendFeadBack,
                              style: Fontstyles.titleStyle,
                            ));
                        await feadBack!.setBool('feadBack', true);
                      },
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: stars == false ? 0.5 : 1,
                  child: Text(
                    softWrap: true,
                    'Send',
                    style: Fontstyles.titleStyle
                        .copyWith(color: Colors.deepPurple.withOpacity(0.9)),
                  ),
                ))
          ],
        );
      },
    );
  }
}
