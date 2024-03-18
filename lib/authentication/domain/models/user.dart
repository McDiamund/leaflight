class User {
  int id;
  String login_key;
  String email;
  String created_at;

  User({
    required this.id,
    required this.email,
    required this.login_key,
    required this. created_at
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login_key': login_key,
      'email': email,
      'created_at': created_at
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      login_key: json['login_key'],
      email: json['email'],
      created_at: json['created_at']
    );
  }
}