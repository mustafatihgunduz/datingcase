import 'package:datingcase/core/model/movie.dart';
import 'package:datingcase/core/repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MovieEvent {}

class LoadInitialMovies extends MovieEvent {}

class LoadMoreMovies extends MovieEvent {}

class RefreshMovies extends MovieEvent {}

class ToggleFavoriteMovie extends MovieEvent {
  final String movieId;
  ToggleFavoriteMovie(this.movieId);
}

class LoadFavoriteMovies extends MovieEvent {}

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  final int currentPage;
  final int totalPages;
  final bool isLoadingMore;
  final bool hasReachedEnd;

  MovieLoaded({
    required this.movies,
    required this.currentPage,
    required this.totalPages,
    this.isLoadingMore = false,
    this.hasReachedEnd = false,
  });

  MovieLoaded copyWith({
    List<Movie>? movies,
    int? currentPage,
    int? totalPages,
    bool? isLoadingMore,
    bool? hasReachedEnd,
  }) {
    return MovieLoaded(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
    );
  }
}

class FavoriteMoviesLoaded extends MovieState {
  final List<Movie> favoriteMovies;

  FavoriteMoviesLoaded({required this.favoriteMovies});
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;
  int _currentPage = 1;
  final int _pageSize = 5;

  MovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<LoadInitialMovies>(_onLoadInitialMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<RefreshMovies>(_onRefreshMovies);
    on<ToggleFavoriteMovie>(_onToggleFavoriteMovie);
    on<LoadFavoriteMovies>(_onLoadFavoriteMovies);
  }

  Future<void> _onLoadInitialMovies(
    LoadInitialMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      _currentPage = 1;
      final response = await movieRepository.getMovies(
        page: _currentPage,
        size: _pageSize,
      );
      emit(
        MovieLoaded(
          movies: response.movies,
          currentPage: response.currentPage,
          totalPages: response.totalPages,
          hasReachedEnd: response.currentPage >= response.totalPages,
        ),
      );
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onLoadMoreMovies(
    LoadMoreMovies event,
    Emitter<MovieState> emit,
  ) async {
    final currentState = state;
    if (currentState is MovieLoaded &&
        !currentState.hasReachedEnd &&
        !currentState.isLoadingMore) {
      emit(currentState.copyWith(isLoadingMore: true));
      try {
        _currentPage++;
        final response = await movieRepository.getMovies(
          page: _currentPage,
          size: _pageSize,
        );
        emit(
          currentState.copyWith(
            movies: List.of(currentState.movies)..addAll(response.movies),
            currentPage: response.currentPage,
            totalPages: response.totalPages,
            isLoadingMore: false,
            hasReachedEnd: response.currentPage >= response.totalPages,
          ),
        );
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    }
  }

  Future<void> _onRefreshMovies(
    RefreshMovies event,
    Emitter<MovieState> emit,
  ) async {
    await _onLoadInitialMovies(LoadInitialMovies(), emit);
  }

  Future<void> _onToggleFavoriteMovie(
    ToggleFavoriteMovie event,
    Emitter<MovieState> emit,
  ) async {
    final currentState = state;
    if (currentState is MovieLoaded) {
      try {
        final updatedMovie = await movieRepository.toggleFavoriteMovie(
          event.movieId,
        );
        final updatedMovies = currentState.movies.map((movie) {
          return movie.id == updatedMovie.id ? updatedMovie : movie;
        }).toList();

        emit(currentState.copyWith(movies: updatedMovies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    }
  }

  Future<void> _onLoadFavoriteMovies(
    LoadFavoriteMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      final favoriteMovies = await movieRepository.getFavoriteMovies();
      emit(FavoriteMoviesLoaded(favoriteMovies: favoriteMovies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
