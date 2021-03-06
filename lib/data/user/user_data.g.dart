// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => new User(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    imgUrl: json['image_url'] as String,
    phone: json['phone'] as int,
    token: json['token'] as String,
    lang: json['lang'] as String,
    place: json['place'] as String,
    password: json['password'] as String);
abstract class _$UserSerializerMixin {
  int get id;

  String get name;

  String get email;

  int get phone;

  String get imgUrl;

  String get token;

  String get lang;

  String get area;

  String get place;

  String get building;

  String get password;

  String get old_password;

  String get new_password;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image_url': imgUrl,
        'area': area,
        'place': place,
        'building': building,
        'token': token,
        'lang': lang,
        'password': password,
        'old_password': old_password,
        'new_password': new_password
      };
}
