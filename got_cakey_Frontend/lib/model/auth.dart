// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String email;
  final int id;
  final String password;
  final String token;
  final String type;

  User(
      {required this.email,
      required this.id,
      required this.password,
      required this.token,
      required this.type});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'id': id,
      'password': password,
      'token': token,
      'type': type
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        email: map['email'] != null ? map['email'] as String : '',
        id: map['id'] != null ? map['id'] as int : 0,
        password: map['password'] != null ? map['password'] as String : '',
        token: map['token'] != null ? map['token'] as String : '',
        type: map['type'] != null ? map['type'] as String : '');
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(Map<String, dynamic> source) => User.fromMap(source);
}
