import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

abstract class Constants {
  static String _baseUrl = 'https://api.themoviedb.org/3';
  static String _apiKey = 'f33521953035af3fc3162fe1ac22e60c';
  static double width = Get.width;
  static double height = Get.height;
  static String KBox = 'favorite_movies';
  static String KHiveFavorite = 'fetch_favorite_movies';
  static String notAvilable = 'Video is not available';
  static String serverFailure = 'Server Failure';

  static List<String> titleMove = ['Favorite Movie', 'Feedback', 'About'];
  static List<String> moviesTypes = [
    'Popular',
    'Soon',
    'Trending',
  ];
  static List<String> dropDownItems = ['EN', 'AR'];
  static String UrlPath = 'https://image.tmdb.org/t/p/w500';
  static String trendingPoint = '/trending/movie/day?api_key=';
  static String popularPoint = '/movie/popular?api_key=';
  static String soonPoint = '/movie/upcoming?api_key=';
  static String nowPoint = '/movie/now_playing?api_key=';
  static String baseUrl = 'https://api.themoviedb.org/3';
  static String apiKey = 'f33521953035af3fc3162fe1ac22e60c';
  static List<Icon> icons = [
    Icon(
      FontAwesomeIcons.bookmark,
      color: Colors.white,
    ),
    Icon(
      FontAwesomeIcons.commentDots,
      color: Colors.white,
    ),
    Icon(
      FontAwesomeIcons.circleInfo,
      color: Colors.white,
    )
  ];
}
