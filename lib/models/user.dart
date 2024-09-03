import 'dart:convert';

class User {
  final String id;
  final String token;
  final String state;
  final String city;
  final String locality;
  final String fullName;
  final String email;
  final String createdAt;
  final String updatedAt;
  final String password;

  User(
      {required this.id,
      required this.token,
      required this.state,
      required this.city,
      required this.locality,
      required this.fullName,
      required this.email,
      required this.createdAt,
      required this.updatedAt,
      required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "token": token,
      "state": state,
      "city": city,
      "locality": locality,
      "fullName": fullName,
      "email": email,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "password": password,
    };
  }

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["_id"] ?? '',
      token: map["token"] ?? '',
      state: map["state"] ?? '',
      city: map["city"] ?? '',
      locality: map["locality"] ?? '',
      fullName: map["fullName"] ?? '',
      email: map["email"] ?? '',
      createdAt: map["createdAt"] ?? '',
      updatedAt: map["updatedAt"] ?? '',
      password: map["password"] ?? '',
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
