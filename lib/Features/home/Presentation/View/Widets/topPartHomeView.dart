import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/Core/Utiles/api.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Core/Utiles/extentions.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';

class Topparthomeview extends StatelessWidget {
  const Topparthomeview({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<moviesModelTrending>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<moviesModelTrending> moviesData = snapshot.data!;
          return Image.network(
              '${Constants.UrlPath + moviesData[0].backdrop_path}');
        }
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.deepPurple,
            size: 100,
          ),
        );
      },
      future: ApiService().getTrending(Constants.trendingPoint),
    );
  }
}
/*
FutureBuilder<List<moviesModelTrending>>(
        future: ApiService().getTrending(Constants.trendingPoint),
        builder: (context, snapshot) {
          List<moviesModelTrending> moviesData = snapshot.data!;
          if (snapshot.hasData) {
            return Container(
              width: Constants.width,
              height: Constants.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(moviesData[0].backdrop_path.orEmpty()))),
            );
          }
          return Center();
        });
  }
}

class BackPoster extends StatelessWidget {
  const BackPoster({super.key, required this.Url});
  final String Url;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(image: DecorationImage(image: NetworkImage(Url))),
    );
*/