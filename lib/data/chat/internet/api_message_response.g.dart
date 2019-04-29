// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiMessageResponse _$ApiMessageResponseFromJson(Map<String, dynamic> json) =>
    new ApiMessageResponse(
        message: json[APIOperations.FCM_SUCCESS] as int,
    messageBody: /*json[APIOperations.USER] == null
            ? null
            : */new Messages.fromJson(
            json[APIOperations.MSG] as Map<String, dynamic>));
abstract class _$ApiResponseSerializerMixin {
  int get message;
  get messageBody;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        APIOperations.FCM_SUCCESS: message,
          APIOperations.MSG: messageBody};

}