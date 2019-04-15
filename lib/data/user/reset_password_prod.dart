import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_doctor/data/user/base/event_object.dart';
import 'package:your_doctor/data/user/internet/api_request.dart';
import 'package:your_doctor/data/user/internet/api_response.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

class ResetPassword implements ResetPasswordRepository {
  @override
  Future<EventObject> fetchResetingPassword(
      String emailId, String oldPassword, String newPassword) async {
    ApiRequest apiRequest = new ApiRequest();
    User user = new User(
        email: emailId, old_password: oldPassword, new_password: newPassword);

    apiRequest.operation = APIOperations.CHANGE_PASSWORD;
    apiRequest.user = user;

    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post(APIConstants.API_BASE_URL,
          body: json.encode(apiRequest.toJson()),
          encoding: Encoding.getByName(encoding));
      if (response != null) {
        if (response.statusCode == APIResponseCode.SC_OK &&
            response.body != null) {
          final responseJson = json.decode(response.body);
          ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
          if (apiResponse.message == APIOperations.SUCCESS) {
            return new EventObject(
                id: EventConstants.CHANGE_PASSWORD_SUCCESSFUL, object: null);
          } else if (apiResponse.message == APIOperations.FAILURE) {
            return new EventObject(id: EventConstants.INVALID_OLD_PASSWORD);
          } else {
            return new EventObject(
                id: EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL);
          }
        } else {
          return new EventObject(
              id: EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject();
      }
    } catch (Exception) {
      return EventObject();
    }
  }
}
