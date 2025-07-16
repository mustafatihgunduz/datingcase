import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/movie_view_model.dart';
import 'package:datingcase/core/viewmodel/user_view_model.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/alerts/unexepted_error.dart';
import 'package:datingcase/view/profile/components/atom/movie_profile_card.dart';
import 'package:datingcase/view/profile/components/user_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBuilder extends StatelessWidget {
  const ProfileBuilder({
    super.key,
    required NavigationService navigationService,
  }) : _navigationService = navigationService;

  final NavigationService _navigationService;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (state is UserLoaded) {
          final user = state.user;
          return Padding(
            padding: EdgeInsets.only(
              top: KStyles.kFiftySize,
              left: KStyles.kThirtySixSize,
              right: KStyles.kTwentySixSize,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserDetail(
                    userID: user.id,
                    userName: user.name!,
                    image: user.photoUrl!,
                  ),
                  SizedBox(height: KStyles.kTwentySixSize),
                  Text(
                    LocaleKeys.my_liked_movies.tr(),
                    style: KStyles.kSubtitleTextStyle(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: KStyles.kTwentyFourSize),
                  BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, movieState) {
                      if (movieState is MovieLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (movieState is FavoriteMoviesLoaded) {
                        final favorites = movieState.favoriteMovies;
                        if (favorites.isEmpty) {
                          return Column(
                            children: [
                              Text(
                                'Henüz beğendiğin film yok. Filmleri keşfet !',
                                style: KStyles.kMovieTitleTextStyle(context),
                              ),
                            ],
                          );
                        }
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                childAspectRatio: 0.6,
                              ),
                          itemCount: favorites.length,
                          itemBuilder: (context, index) {
                            final movie = favorites[index];
                            return MovieProfileCard(movie: movie);
                          },
                        );
                      } else if (movieState is MovieError) {
                        return Text(
                          'Error loading favorites: ${movieState.message}',
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator.adaptive();
        }
      },
      listener: (context, state) {
        if (state is UserError) {
          unexceptedError(context, _navigationService);
        }
      },
    );
  }
}
