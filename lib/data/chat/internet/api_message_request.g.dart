// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_request.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiMessageRequest _$ApiRequestFromJson(Map<String, dynamic> json) => new ApiMessageRequest(
    // operation: json['operation'] as String,
    message: json[APIOperations.USER] == null
        ? null
        : new Messages.fromJson(json[APIOperations.USER] as Map<String, dynamic>));

abstract class _$ApiRequestSerializerMixin {
  String get operation;

  Messages messageBody;

  Map<String, dynamic> toJson() => <String, dynamic>{
        APIOperations.PHONE: messageBody.id,
        APIOperations.PASSWORD: messageBody.text,
      };
}
