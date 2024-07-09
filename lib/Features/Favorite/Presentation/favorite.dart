import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Favorite/Data/Models/favorite_Model.dart';
import 'package:movies_app/Features/Favorite/Presentation/View/Widgets/FavoriteViewBody.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/getData/getdata_cubit.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key, required this.Data});
  final List<FavoriteModel> Data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetdataCubit>(
      create: (context) => GetdataCubit(),
      child: Favoriteviewbody(
        Data: Data,
      ),
    );
  }
}
