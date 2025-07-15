import 'package:datingcase/core/model/movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final int currentPage;
  final int totalPages;

  MovieResponse({
    required this.movies,
    required this.currentPage,
    required this.totalPages,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    final List moviesJson = data['movies'] ?? [];
    final pagination = data['pagination'] ?? {};

    final int currentPage = pagination['currentPage'] ?? 1;
    final int totalPages = pagination['maxPage'] ?? 1;

    return MovieResponse(
      movies: moviesJson.map((e) => Movie.fromJson(e)).toList(),
      currentPage: currentPage,
      totalPages: totalPages,
    );
  }
}
