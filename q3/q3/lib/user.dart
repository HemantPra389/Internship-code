class User {
  final String name;
  final String email;
  final String source;

  User(this.name, this.email, this.source);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['email'],
      json['source'],
    );
  }

  String get fullName => '$name <$email>';

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'source': source,
      };
}
