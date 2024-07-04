import 'package:get/get.dart';

abstract class Constants {
  static double width = Get.width;
  static double height = Get.height;
  static List<String> titleMove = [
    'Favorite Movie',
    'Language',
    'Feedback',
    'About'
  ];
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
}
