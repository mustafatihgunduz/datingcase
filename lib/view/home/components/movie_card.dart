import 'package:datingcase/core/model/movie.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onFavoriteTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onFavoriteTap,
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
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title!, style: TextStyle(color: Colors.white)),
                  Text(
                    movie.description!,
                    style: TextStyle(color: Colors.white70),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                movie.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: onFavoriteTap,
            ),
          ),
        ],
      ),
    );
  }
}
