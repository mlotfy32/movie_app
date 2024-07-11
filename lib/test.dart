import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/Core/Utiles/constants.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              if (Hive.isBoxOpen(Constants.KHiveFavorite)) {
                log('box is open');
              } else {
                log('box is close');
              }
            },
            child: Text('Hive Cheker'),
          ),
          ElevatedButton(
            onPressed: () {
              Hive.openBox(Constants.KHiveFavorite);
            },
            child: Text('open Box'),
          ),
          ElevatedButton(
            onPressed: () {
              Hive.close();
            },
            child: Text('close Box'),
          ),
        ],
      )),
    );
  }
}
