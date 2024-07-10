import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/detailes/Presentation/ViewModel/addtofavorite/addtofavorite_cubit.dart';
import 'package:movies_app/Features/detailes/Presentation/View/DetailesView.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/checkiscontain/checkiscontain_cubit.dart';

class CustomeListView extends StatelessWidget {
  const CustomeListView({super.key, required this.Data, required this.id});
  final List Data;
  final List id;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: Data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
              children: [
                InkWell(
                  onTap: () async {
                    await BlocProvider.of<CheckiscontainCubit>(context)
                        .isContain(index, Data);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    margin:
                        EdgeInsets.only(top: 3, left: 5, right: 5, bottom: 0),
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
