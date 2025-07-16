import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/model/movie.dart';
import 'package:flutter/material.dart';

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
