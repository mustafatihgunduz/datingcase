import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/movie_view_model.dart';
import 'package:datingcase/view/home/components/movie_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final NavigationService _navigationService = NavigationService();

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(LoadInitialMovies());
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;

    final thresholdPixels = 100.0;

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
      body: MovieBuilder(
        scrollController: scrollController,
        navigationService: _navigationService,
      ),
    );
  }
}
