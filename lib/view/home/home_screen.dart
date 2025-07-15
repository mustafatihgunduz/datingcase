import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/viewmodel/movie_view_model.dart';
import 'package:datingcase/view/home/components/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(LoadInitialMovies());
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;

    final thresholdPixels = 50.0;

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - thresholdPixels) {
      context.read<MovieBloc>().add(LoadMoreMovies());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
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
                        context.read<MovieBloc>().add(
                          ToggleFavoriteMovie(movie.id),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
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
      ),
    );
  }
}
