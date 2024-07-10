import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/search/Presentation/View/Widgets/SearchViewBody.dart';
import 'package:movies_app/Features/search/Presentation/ViewModel/search_about_cubit.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchAboutCubit>(
      create: (context) => SearchAboutCubit(),
      child: Searchviewbody(),
    );
  }
}
