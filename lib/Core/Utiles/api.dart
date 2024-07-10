import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/Features/detailes/Data/Models/actors.dart';
import 'package:movies_app/Features/home/Data/Models/popular.dart';
import 'package:movies_app/Features/home/Data/Models/trending.dart';
import 'package:movies_app/Features/search/Data/Models/search.dart';
import 'package:movies_app/Features/vedioPlayer/Data/Models/video.dart';

// vedio= https://api.themoviedb.org/3/movie/1022789/videos?api_key=f33521953035af3fc3162fe1ac22e60c
// actors = https://api.themoviedb.org/3/movie/1022789/credits?api_key=f33521953035af3fc3162fe1ac22e60c
// search = https://api.themoviedb.org/3/search/movie?api_key=f33521953035af3fc3162fe1ac22e60c&query=??
// youtube player flutter
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

  Future<List<moviesModelSearch>> searchAbout(String search) async {
    List<moviesModelSearch> moviesList = [];

    var response =
        await _dio.get('$_baseUrl/search/movie?api_key=$_apiKey&query=$search');
    var data = response.data;
    for (int i = 0; i < data['results'].length; i++) {
      moviesList.add(moviesModelSearch.fromJson(data['results'][i]));
    }
    return moviesList;
  }

  Future<List<moviesModelActoes>> getActors(int id) async {
    List<moviesModelActoes> moviesList = [];

    var response =
        await _dio.get('$_baseUrl/movie/$id/credits?api_key=$_apiKey');
    var data = response.data;
    for (int i = 0; i < data['cast'].length; i++) {
      moviesList.add(moviesModelActoes.fromJson(data['cast'][i]));
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

  Future<List<moviesModelVideo>> getVideo(int id) async {
    List<moviesModelVideo> moviesList = [];
    log('======================');
    var response =
        await _dio.get('$_baseUrl/movie/$id/videos?api_key=$_apiKey');
    var data = response.data;
    for (int i = 0; i < data['results'].length; i++) {
      moviesList.add(moviesModelVideo.fromJson(data['results'][i]));
    }
    return moviesList;
  }
}
