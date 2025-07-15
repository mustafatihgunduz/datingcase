import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/model/movie.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/movie_view_model.dart';
import 'package:datingcase/core/viewmodel/user_view_model.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/alerts/unexepted_error.dart';
import 'package:datingcase/view/components/custom_back_button.dart';
import 'package:datingcase/view/premium/limited_box_screen.dart';
import 'package:datingcase/view/profile/components/user_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final NavigationService _navigationService = NavigationService();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(LoadUserProfile());
    context.read<MovieBloc>().add(LoadFavoriteMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      appBar: AppBar(
        leadingWidth: 72,
        forceMaterialTransparency: true,
        leading: CustomBackArrow(
          navigationService: _navigationService,
          isProfileScreen: true,
        ),
        title: Text(
          LocaleKeys.profile_detail.tr(),
          style: KStyles.kAppbarTitleTextStyle(context),
        ),
        actions: [
          ElevatedButton(
            style: KStyles.kLimitedOfferButtonStyle(context),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return LimitedBoxScreen();
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/diamond.png'),
                SizedBox(width: KStyles.kFourSize),
                Text(
                  LocaleKeys.limited_offer.tr(),
                  style: KStyles.kLimitedOfferButtonTextStyle(context),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocConsumer<UserBloc, UserState>(
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
      ),
    );
  }
}

class MovieProfileCard extends StatelessWidget {
  const MovieProfileCard({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8),
          child: SizedBox(
            width: 153,
            height: 210,
            child: Image.network(
              movie.posterUrl!,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://picsum.photos/150',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        SizedBox(height: KStyles.kFifteenSize),
        Text(movie.title!, style: KStyles.kMovieTitleTextStyle(context)),
        Text(movie.title!, style: KStyles.kMovieYearTextStyle(context)),
      ],
    );
  }
}
