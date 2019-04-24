// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiMessageResponse _$ApiResponseFromJson(Map<String, dynamic> json) =>
    new ApiMessageResponse(
        message: json[APIOperations.SUCCESS_MESSAGE] as String,
        messageBody: json[APIOperations.USER] == null
            ? null
            : new Messages.fromJson(
                json[APIOperations.USER] as Map<String, dynamic>));

abstract class _$ApiResponseSerializerMixin {
  String get message;

  Messages get messageBody;

  Map<String, dynamic> toJson() => <String, dynamic>{
        APIOperations.SUCCESS_MESSAGE: message,
        APIOperations.USER: messageBody
      };
}
