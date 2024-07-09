import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/home/Data/Models/actors.dart';

class ActorsList extends StatelessWidget {
  const ActorsList({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.width,
      height: Constants.height * 0.35,
      child: FutureBuilder<List<moviesModelActoes>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<moviesModelActoes> actors = snapshot.data!;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: actors.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          width: Constants.width * 0.4,
                          height: Constants.height * 0.3,
                          margin:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      actors[index].profile_path == ''
                                          ? Appassetes.posterError
                                          : Constants.UrlPath +
                                              actors[index].profile_path),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: Constants.width * 0.4,
                          child: Text(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            '${actors[index].name}',
                            style: Fontstyles.titleStyle,
                          ),
                        )
                      ],
                    ));
          }

          return Center(
            child: Lottie.asset(Appassetes.loadingDialog,
                width: Constants.width * 0.6, height: Constants.height * 0.17),
          );
        },
        future: ApiService().getActors(id),
      ),
    );
  }
}
