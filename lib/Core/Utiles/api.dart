import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/Features/home/Data/Models/popular.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';

class ApiService {
  Dio _dio = Dio();
  String _baseUrl = 'https://api.themoviedb.org/3';
  String _apiKey = 'f33521953035af3fc3162fe1ac22e60c';

  Future<List<moviesModelTrending>> getTrending(String endPoint) async {
    List<moviesModelTrending> moviesList = [];

    var response = await _dio.get('$_baseUrl$endPoint$_apiKey');
    var data = response.data;
    for (int i = 0; i < data['results'].length; i++) {
      moviesList.add(moviesModelTrending.fromJson(data['results'][i]));
    }
    return moviesList;
  }

  Future<List<moviesModelPopular>> getPopular(String endPoint) async {
    List<moviesModelPopular> moviesList = [];

    var response = await _dio.get('$_baseUrl$endPoint$_apiKey');
    var data = response.data;
    for (int i = 0; i < data['results'].length; i++) {
      moviesList.add(moviesModelPopular.fromJson(data['results'][i]));
    }
    return moviesList;
  }

  Future<List<moviesModelPopular>> getSoon(String endPoint) async {
    List<moviesModelPopular> moviesList = [];
    log('======================');
    var response = await _dio.get('$_baseUrl$endPoint$_apiKey');
    var data = response.data;
    for (int i = 0; i < data['results'].length; i++) {
      moviesList.add(moviesModelPopular.fromJson(data['results'][i]));
    }
    return moviesList;
  }

// //
//   Future<List<moviesModelSoon>> getMoviesSoom(String endPoint) async {
//     // Uri url = Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey');
//     var data = await _dio.get('$_baseUrl$endPoint$_apiKey');

//     List<moviesModelSoon> moviesList = [];
//     for (int i = 0; i < data.length; i++) {
//       moviesList.add(moviesModelSoon.fromJson(data['results'][i]));
//     }
//     print('ffff${data['results'][0]['title']}');
//     return moviesList;
//   }

//   Future<List<moviesModelPopular>> getPopular(String endPoint) async {
//     //  Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
//     var data = await _dio.get('$_baseUrl$endPoint$_apiKey');

//     Map<String, dynamic> data = jsonDecode(response.body);
//     List<moviesModelPopular> moviesList = [];
//     for (int i = 0; i < data['results'].length; i++) {
//       moviesList.add(moviesModelPopular.fromJson(data['results'][i]));
//     }
//     print(moviesList);
//     return moviesList;
//   }
}
