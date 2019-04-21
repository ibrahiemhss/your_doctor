import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/constant.dart';

part 'api_message_request.g.dart';

@JsonSerializable()
class ApiMessageRequest extends Object with _$ApiRequestSerializerMixin {
  String operation;
  Messages  message;

  ApiMessageRequest({this.operation, this.message});

  factory ApiMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiRequestFromJson(json);
}
