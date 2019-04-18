// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => new ApiResponse(
    error: json[APIOperations.ERROR] as bool,
    message: json[APIOperations.SUCCESS_MESSAGE] as String,
    user: json[APIOperations.USER] == null
        ? null
        : new User.fromJson(json[APIOperations.USER] as Map<String, dynamic>));

abstract class _$ApiResponseSerializerMixin {
  bool get error;

  String get message;

  User get user;

  Map<String, dynamic> toJson() => <String, dynamic>{
        APIOperations.ERROR: error,
        APIOperations.SUCCESS_MESSAGE: message,
        APIOperations.USER: user
      };
}
