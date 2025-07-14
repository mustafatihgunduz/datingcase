class Movie {
  final String id;
  String? title;
  String? description;
  String? posterUrl;

  Movie({required this.id, this.title, this.description, this.posterUrl});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
    };
  }

  Movie.fromJson(Map<String, dynamic> map)
    : id = map['id'],
      title = map['title'],
      description = map['description'],
      posterUrl = map['posterUrl'];
}
