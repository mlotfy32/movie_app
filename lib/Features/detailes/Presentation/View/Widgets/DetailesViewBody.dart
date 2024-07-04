import 'package:flutter/material.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/detailes/Presentation/View/Widgets/CustomeAppBar.dart';

class Detailesviewbody extends StatelessWidget {
  const Detailesviewbody(
      {super.key,
      required this.Url,
      required this.overView,
      required this.vote_average,
      required this.vote_count,
      required this.release_date,
      required this.title});
  final String Url, overView, release_date, title;
  final double vote_average;
  final int vote_count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.network(
          '${Constants.UrlPath + Url}',
          fit: BoxFit.fitHeight,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                  Colors.black
                ]),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: Constants.height * 0.2, left: 10, right: 10),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Fontstyles.titleStyle,
                ),
                Text(
                  '$vote_average',
                  style:
                      Fontstyles.titleStyle.copyWith(color: Colors.deepPurple),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Constants.height * 0.28, left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              release_date,
              style:
                  Fontstyles.titleStyle.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Constants.height * 0.68, left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              overView,
              style: Fontstyles.titleStyle
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
              top: Constants.height * 0.1,
            ),
            child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(height: 50, child: CustomeDetailesappbar()))),
      ],
    ));
  }
}
