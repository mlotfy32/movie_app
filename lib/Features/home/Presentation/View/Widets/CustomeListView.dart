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

class CustomeListView extends StatelessWidget {
  const CustomeListView({super.key, required this.Data});
  final List Data;
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
                    await isContain(index);
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

  Future isContain(int index) async {
    await Hive.openBox(Constants.KBox);
    try {
      await Hive.box(Constants.KBox).close();
      if (!Hive.isBoxOpen(Constants.KBox)) {
        await Hive.openBox(Constants.KBox);
        var HiveData = await Hive.box(Constants.KBox).get(Data[index].title);
        Get.to(
            duration: Duration(milliseconds: 900),
            () => Detailesview(
                  isContain: HiveData == null ? false : true,
                  title: Data[index].title,
                  Url: Data[index].poster_path,
                  overView: Data[index].overview,
                  release_date: Data[index].release_date,
                  vote_average: Data[index].vote_average,
                  vote_count: Data[index].vote_count,
                ),
            curve: Curves.bounceIn);
      }
    } catch (e) {}
  }
}
