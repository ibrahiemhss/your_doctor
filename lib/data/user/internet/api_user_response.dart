import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

part 'api_user_response.g.dart';

@JsonSerializable()
class ApiUserResponse extends Object with _$ApiResponseSerializerMixin {
  bool error;
  String message;
  User user;

  ApiUserResponse({this.error, this.message, this.user});

  factory ApiUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
