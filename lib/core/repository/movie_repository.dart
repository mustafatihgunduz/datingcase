import 'package:datingcase/core/model/movie.dart';
import 'package:datingcase/core/model/movie_response.dart';
import 'package:datingcase/core/services/movie_service.dart';
import 'package:flutter/foundation.dart';

class MovieRepository {
  final MovieService movieService;

  MovieRepository({required this.movieService});

  Future<MovieResponse> getMovies({
    required int page,
    required int size,
  }) async {
    if (kDebugMode) {
      return await movieService.getMovies(page: page, size: size);
    } else {
      return MovieResponse(movies: [], currentPage: 0, totalPages: 0);
    }
  }

  Future<Movie> toggleFavoriteMovie(String movieId) async {
    if (kDebugMode) {
      return await movieService.toggleFavoriteMovie(movieId);
    } else {
      return Movie(id: '1');
    }
  }

  Future<List<Movie>> getFavoriteMovies() async {
    if (kDebugMode) {
      return await movieService.getFavoriteMovies();
    } else {
      return [];
    }
  }
}
