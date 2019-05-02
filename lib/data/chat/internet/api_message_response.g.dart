// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiMessageResponse _$ApiMessageResponseFromJson(Map<String, dynamic> json) =>
    new ApiMessageResponse(

    messageBody: /*json[APIOperations.USER] == null
            ? null
            : */new MessageBody.fromJson(
            json[APIOperations.MSG] as Map<String, dynamic>));
abstract class _$ApiResponseSerializerMixin {
  get messageBody;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
          APIOperations.MSG: messageBody};

}