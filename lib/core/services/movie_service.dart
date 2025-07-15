import 'dart:convert';

import 'package:datingcase/core/model/movie.dart';
import 'package:datingcase/core/model/movie_response.dart';
import 'package:datingcase/core/services/logger_service.dart';
import 'package:datingcase/core/services/secure_storage_service.dart';
import 'package:http/http.dart' as http;

class MovieService {
  String baseUrl = "https://caseapi.servicelabs.tech";
  final SecureStorageService _secureStorageService = SecureStorageService();
  Future<MovieResponse> getMovies({
    required int page,
    required int size,
  }) async {
    final Uri uri = Uri.parse('$baseUrl/movie/list?page=$page&size=$size');
    final token = await _secureStorageService.getToken();

    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      CaseLogger.info('Coming response code is : ${response.statusCode}');
      CaseLogger.info('Coming Body is : ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        return MovieResponse.fromJson(body);
      } else {
        CaseLogger.error(
          'Response code is not 200 - Coming Response code : ${response.statusCode}',
        );
        throw Exception(
          'Response code is not 200 - Coming Response code : ${response.statusCode}',
        );
      }
    } catch (e, stack) {
      CaseLogger.error('GetMovies Error : $e And the stacktree is : $stack');
      throw Exception('GetMovies Error : $e And the stacktree is : $stack');
    }
  }

  Future<List<Movie>> getFavoriteMovies() async {
    final Uri url = Uri.parse('$baseUrl/movie/favorites');
    final token = await _secureStorageService.getToken();
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      CaseLogger.info(
        'Gelen response code from getFavoriteMovies : ${response.statusCode}',
      );
      CaseLogger.info(
        'Gelen response body from getFavoriteMovies : ${response.body}',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> movieMap = jsonDecode(response.body);
        final List<dynamic> data = movieMap['data'];
        return data.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        CaseLogger.error('Gelen Response Code 200 Değil !');
        throw Exception('Invalid Response Code');
      }
    } catch (e, stack) {
      CaseLogger.error('getFavoriesMovies Error : $e');
      throw Exception(
        'Something went wrond for getFavoriesMovies : $e , $stack',
      );
    }
  }

  Future<Movie> toggleFavoriteMovie(String movieId) async {
    final Uri url = Uri.parse('$baseUrl/movie/favorite/$movieId');
    final token = await _secureStorageService.getToken();

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      CaseLogger.info('POST favorite response: ${response.statusCode}');
      CaseLogger.info('POST favorite body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final movieJson = body['data']['movie'];
        return Movie.fromJson(movieJson);
      } else {
        throw Exception('Invalid Response Code');
      }
    } catch (e, stack) {
      CaseLogger.error('toggleFavoriteMovie error: $e\n$stack');
      throw Exception('Error in toggleFavoriteMovie: $e');
    }
  }
}
