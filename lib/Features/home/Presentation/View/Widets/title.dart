import 'package:flutter/material.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';

class CustomeTitle extends StatelessWidget {
  const CustomeTitle({super.key, required this.titile});
  final String titile;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 400, left: 10, right: 10),
        child: Text(
          titile,
          overflow: TextOverflow.ellipsis,
          style: Fontstyles.titleStyle,
        ),
      ),
    );
  }
}
