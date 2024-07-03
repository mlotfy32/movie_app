import 'package:flutter/material.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';

class CustomeTitle extends StatelessWidget {
  const CustomeTitle({super.key, required this.titile});
  final String titile;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 400),
        child: Center(
          child: Text(
            titile,
            overflow: TextOverflow.clip,
            style: Fontstyles.titleStyle,
          ),
        ),
      ),
    );
  }
}
