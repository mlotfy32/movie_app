import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/imageState/get_next_image_cubit.dart';

class Backgroundimage extends StatelessWidget {
  const Backgroundimage({super.key, required this.backdrop_path});
  final String backdrop_path;
  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        height: Constants.height * 0.4,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('${Constants.UrlPath + backdrop_path}'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
