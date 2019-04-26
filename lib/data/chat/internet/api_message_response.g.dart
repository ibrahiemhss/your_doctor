// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiMessageResponse _$ApiMessageResponseFromJson(Map<String, dynamic> json) =>
    new ApiMessageResponse(
        message: json[APIOperations.FCM_SUCCESS] as int);

abstract class _$ApiResponseSerializerMixin {
  int get message;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        APIOperations.FCM_SUCCESS: message};

}