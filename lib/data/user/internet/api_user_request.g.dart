// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_request.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiUserRequest _$ApiRequestFromJson(Map<String, dynamic> json) => new ApiUserRequest(
    // operation: json['operation'] as String,
    user: json[APIOperations.USER] == null
        ? null
        : new User.fromJson(json[APIOperations.USER] as Map<String, dynamic>));

abstract class _$ApiRequestSerializerMixin {
  String get operation;

  User get user;

  Map<String, dynamic> toJson() => <String, dynamic>{
        APIOperations.PHONE: user.phone,
        APIOperations.PASSWORD: user.password,
        APIOperations.TOKEN: user.token,
        APIOperations.LANG: user.lang
      };
}
