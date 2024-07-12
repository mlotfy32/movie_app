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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.066,
      child: Row(
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
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.034,
                            child: Text(
                              Constants.moviesTypes[index],
                              style:
                                  Fontstyles.titleStyle.copyWith(fontSize: 19),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(colors: [
                                  Colors.blue,
                                  Colors.deepPurpleAccent
                                ])),
                            width: MediaQuery.sizeOf(context).width * 0.25,
                            height: MediaQuery.sizeOf(context).height * 0.005,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.034,
                        child: Text(
                          Constants.moviesTypes[index],
                          style: Fontstyles.titleStyle.copyWith(fontSize: 18),
                        ),
                      ));
          }).toList()),
    );
  }
}
