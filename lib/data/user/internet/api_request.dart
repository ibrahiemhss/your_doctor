import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

part 'api_request.g.dart';

@JsonSerializable()
class ApiRequest extends Object with _$ApiRequestSerializerMixin {
  String operation;
  User user;

  ApiRequest({this.operation, this.user});

  factory ApiRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiRequestFromJson(json);
}
