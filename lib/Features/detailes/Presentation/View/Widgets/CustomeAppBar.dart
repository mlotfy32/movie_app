import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';

class CustomeDetailesappbar extends StatelessWidget {
  CustomeDetailesappbar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.heart,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
