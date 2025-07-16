import 'package:datingcase/core/services/firebase_analytics_service.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/movie_view_model.dart';
import 'package:datingcase/view/home/components/movie_card.dart';
import 'package:datingcase/view/home/components/movie_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBuilder extends StatelessWidget {
  const MovieBuilder({
    super.key,
    required this.scrollController,
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  final ScrollController scrollController;
  final NavigationService _navigationService;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return MovieCardShimmer();
        } else if (state is MovieLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<MovieBloc>().add(RefreshMovies());
            },
            child: GridView.builder(
              controller: scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.57,
              ),
              itemCount: state.hasReachedEnd
                  ? state.movies.length
                  : state.movies.length + 1,
              itemBuilder: (context, index) {
                if (index < state.movies.length) {
                  final movie = state.movies[index];
                  return MovieCard(
                    movie: movie,
                    onFavoriteTap: () {
                      FirebaseAnalyticsService().logAddToFavorites(
                        movieId: movie.id,
                        movieTitle: movie.title!,
                      );
                      context.read<MovieBloc>().add(
                        ToggleFavoriteMovie(movie.id),
                      );
                    },
                    navigationService: _navigationService,
                  );
                } else {
                  return MovieCardShimmer();
                }
              },
            ),
          );
        } else if (state is MovieError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
