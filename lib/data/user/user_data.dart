import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/user/base/event_object.dart';

part 'user_data.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  String name;
  String email;
  String phone;
  String token;
  String lang;
  String imgUrl;

  String place;
  String building;
  String area;

  String unique_id;
  String password;
  String old_password;
  String new_password;

  User(
      {this.name,
      this.email,
      this.phone,
      this.imgUrl,
      this.token,
      this.lang,
      this.place,
      this.area,
      this.building,
      this.unique_id,
      this.password,
      this.old_password,
      this.new_password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

abstract class LogInUserRepository {
  Future<EventObject> fetchLogInUser(
      String emailId, String password, String token, String lang, String image);
}

abstract class RegisterUserRepository {
  Future<EventObject> fetchRegisteringUser(
      String name,
      String emailId,
      String imagUrl,
      String phone,
      String password,
      String place,
      String area,
      String building,
      String token,
      String lang);
}

abstract class ResetPasswordRepository {
  Future<EventObject> fetchResetingPassword(
      String name, String emailId, String password);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
