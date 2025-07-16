import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/model/movie.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onFavoriteTap;
  final NavigationService navigationService;
  const MovieCard({
    super.key,
    required this.movie,
    required this.onFavoriteTap,
    required this.navigationService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth!,
            height: SizeConfig.screenHeight!,
            child: Image.network(
              movie.posterUrl ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://picsum.photos/800',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
            bottom: 26,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: KStyles.kThirtyThreeSize,
              ),
              child: Row(
                children: [
                  Image.asset('assets/icons/movie_header.png'),
                  SizedBox(width: KStyles.kNineSize),
                  Container(
                    constraints: BoxConstraints(maxWidth: 250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title!,
                          style: KStyles.kMovieCardTitleTextStyle(context),
                        ),
                        Text(
                          movie.description!,
                          style: KStyles.kMovieCardDescriptionTextStyle(
                            context,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.screenHeight! / 10,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: KStyles.kThirteenSize / 2,
                vertical: KStyles.kTwentySize,
              ),
              decoration: KStyles.kAddPhotoContainerDecoration(),
              child: IconButton(
                icon: Icon(
                  movie.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: KStyles.kWhiteColor,
                ),
                onPressed: onFavoriteTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
