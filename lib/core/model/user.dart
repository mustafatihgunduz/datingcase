class User {
  final String id;
  final String? token;
  String? name;
  String? email;
  String? photoUrl;

  User({required this.id, this.token, this.email, this.name, this.photoUrl});

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  User.fromJson(Map<String, dynamic> map)
    : id = map['id'],
      token = map['token'],
      name = map['name'],
      email = map['email'],
      photoUrl = map['photoUrl'];
}
