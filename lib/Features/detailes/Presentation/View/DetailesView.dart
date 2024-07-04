import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/addtofavorite_cubit.dart';
import 'package:movies_app/Features/detailes/Presentation/View/Widgets/DetailesViewBody.dart';

class Detailesview extends StatelessWidget {
  const Detailesview(
      {super.key,
      required this.Url,
      required this.vote_average,
      required this.vote_count,
      required this.overView,
      required this.release_date,
      required this.title});
  final String Url, overView, release_date, title;
  final double vote_average;
  final int vote_count;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddtofavoriteCubit>(
      create: (context) => AddtofavoriteCubit(),
      child: Detailesviewbody(
        Url: Url,
        overView: overView,
        vote_average: vote_average,
        vote_count: vote_count,
        release_date: release_date,
        title: title,
      ),
    );
  }
}
