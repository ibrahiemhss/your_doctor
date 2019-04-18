import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:your_doctor/data/user/base/event_object.dart';
import 'package:your_doctor/data/user/internet/api_request.dart';
import 'package:your_doctor/data/user/internet/api_response.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

class ProdLogInRepository implements LogInUserRepository {
  @override
  Future<EventObject> fetchLogInUser(String emailId, String password,
      String token, String lang, String image) async {
    // TODO: implement fetchUser
    var queryParameters = {
      APIOperations.PHONE: emailId,
      APIOperations.PASSWORD: password,
      APIOperations.TOKEN: token,
      APIOperations.LANG: lang,
      APIOperations.IMAGE_URL: image,
    };
    ApiRequest apiRequest = new ApiRequest();
    User user = new User(
        phone: emailId,
        imgUrl: image,
        password: password,
        token: token,
        lang: lang);

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
          ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
          if (apiResponse.error == false) {
            return new EventObject(
                id: EventConstants.LOGIN_USER_SUCCESSFUL,
                object: apiResponse.user);
          } else {
            return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
          }
        } else {
          return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject();
      }
    } catch (Exception) {
      return EventObject();
    }
  }
// TODO: implement fetchteColors

}
