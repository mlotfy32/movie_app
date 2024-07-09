import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/ChangeMovieState/changemovietype_cubit.dart';

class CustomeTextButton extends StatelessWidget {
  const CustomeTextButton({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: Constants.moviesTypes.asMap().entries.map((e) {
          int index = e.key;
          return TextButton(
              onPressed: () {
                BlocProvider.of<ChangemovietypeCubit>(context)
                    .ChangeMovieType(index);
              },
              child: initialIndex == index
                  ? Column(
                      children: [
                        Text(
                          Constants.moviesTypes[index],
                          style: Fontstyles.titleStyle.copyWith(fontSize: 19),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(colors: [
                                Colors.blue,
                                Colors.deepPurpleAccent
                              ])),
                          width: Constants.width * 0.25,
                          height: 3,
                        ),
                      ],
                    )
                  : Text(
                      Constants.moviesTypes[index],
                      style: Fontstyles.titleStyle.copyWith(fontSize: 18),
                    ));
        }).toList());
  }
}
