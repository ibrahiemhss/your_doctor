import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/data/user/internet/api_user_request.dart';
import 'package:your_doctor/data/user/internet/api_user_response.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

class ProdLogInRepository implements LogInUserRepository {
  @override
  Future<EventUserObject> fetchLogInUser(
      String emailId, String password, String token) async {
    // TODO: implement fetchUser
    var queryParameters = {
      APIOperations.PHONE: emailId,
      APIOperations.PASSWORD: password,
      APIOperations.TOKEN: token,
      APIOperations.LANG: "en",
    };
    ApiUserRequest apiRequest = new ApiUserRequest();
    User user = new User(phone: int.parse(emailId), password: password);

    apiRequest.operation = APIOperations.LOGIN;
    apiRequest.user = user;

    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post(APIConstants.API_LOGIN_URL,
          body: queryParameters, encoding: Encoding.getByName(encoding));
      if (response != null) {
        if (response.statusCode == APIResponseCode.SC_OK &&
            response.body != null) {
          final responseJson = json.decode(response.body);
          ApiUserResponse apiResponse = ApiUserResponse.fromJson(responseJson);
          if (apiResponse.error == false) {
         print("ApiResponseUserLogin=======================>${apiResponse.user.toString()}");
            return new EventUserObject(
                id: EventUserConstants.LOGIN_USER_SUCCESSFUL,
                messageResponse: apiResponse.message,
                object:
                apiResponse.user);
          } else {
            return new EventUserObject(
                id: EventUserConstants.LOGIN_USER_UN_SUCCESSFUL,
                messageResponse: apiResponse.message);
          }
        } else {
          return new EventUserObject(
              id: EventUserConstants.LOGIN_USER_UN_SUCCESSFUL);
        }
      } else {
        return new EventUserObject();
      }
    } catch (Exception) {
      print(
          "errorIn LogIn =========>============>=========>is => ${Exception.toString()}");

      return EventUserObject();
    }
  }
// TODO: implement fetchteColors

}
