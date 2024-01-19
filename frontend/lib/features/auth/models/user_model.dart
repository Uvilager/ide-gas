// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String username;
  final String email;
  final String password;
  final String accessToken;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.accessToken,
  });

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? accessToken,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'accessToken': accessToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      accessToken: map['access_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, password: $password, accessToken: $accessToken)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        accessToken.hashCode;
  }
}
