import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/constant.dart';

part 'api_message_response.g.dart';

@JsonSerializable()
class ApiMessageResponse extends Object with _$ApiResponseSerializerMixin {
  String message;
  Messages messageBody;

  ApiMessageResponse({ this.message, this.messageBody});

  factory ApiMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
