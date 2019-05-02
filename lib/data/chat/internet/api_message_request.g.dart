// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_request.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiMessageRequest _$ApiRequestFromJson(Map<String, dynamic> json) =>
    new ApiMessageRequest(
        // operation: json['operation'] as String,
        messageBody: json[APIOperations.USER] == null
            ? null
            : new MessageBody.fromJson(
                json[APIOperations.USER] as Map<String, dynamic>));

abstract class _$ApiRequestSerializerMixin {
  String get operation;
  MessageBody get messageBody;

  Map<String, dynamic> toJson() => <String, dynamic>{
        APIOperations.MSG_CONTENT: messageBody.msg_content,
      };
}
