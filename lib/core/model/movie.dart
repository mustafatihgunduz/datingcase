class Movie {
  final String id;
  String? title;
  String? description;
  String? posterUrl;
  bool isFavorite;

  Movie({
    required this.id,
    this.title,
    this.description,
    this.posterUrl,
    this.isFavorite = false,
  });

  Movie copyWith({
    String? id,
    String? title,
    String? description,
    String? posterUrl,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['Title'],
      description: json['Plot'],
      posterUrl: json['Poster'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
