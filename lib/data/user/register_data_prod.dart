import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:your_doctor/data/user/base/event_object.dart';
import 'package:your_doctor/data/user/internet/api_request.dart';
import 'package:your_doctor/data/user/internet/api_response.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

class ProdRegisterRepository implements RegisterUserRepository {
  @override
  Future<EventObject> fetchRegisteringUser(
      String name,
      String emailId,
      String imgUrl,
      String phone,
      String password,
      String place,
      String area,
      String building,
      String token,
      String lang) async {
    // TODO: implement fetchUser
    var queryParameters = {
      APIOperations.NAME: name,
      //APIOperations.EMAIL: name,
      APIOperations.PHONE: "000",
      APIOperations.PASSWORD: password,

      APIOperations.PLACE: token,
      APIOperations.AREA: token,
      APIOperations.BUILDING: token,
      APIOperations.TOKEN: token,
      APIOperations.LANG: lang,
    };
    ApiRequest apiRequest = new ApiRequest();
    User user = new User(name: name, email: emailId, password: password);

    apiRequest.operation = APIOperations.REGISTER;
    apiRequest.user = user;

    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post(APIConstants.API_BASE_URL,
          body: queryParameters, encoding: Encoding.getByName(encoding));
      if (response != null) {
        if (response.statusCode == APIResponseCode.SC_OK &&
            response.body != null) {
          final responseJson = json.decode(response.body);
          ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
          if (apiResponse.message == APIOperations.SUCCESS) {
            return new EventObject(
                id: EventConstants.USER_REGISTRATION_SUCCESSFUL, object: null);
          } else if (apiResponse.message == APIOperations.FAILURE) {
            return new EventObject(id: EventConstants.USER_ALREADY_REGISTERED);
          } else {
            return new EventObject(
                id: EventConstants.USER_REGISTRATION_UN_SUCCESSFUL);
          }
        } else {
          return new EventObject(
              id: EventConstants.USER_REGISTRATION_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject();
      }
    } catch (Exception) {
      return EventObject();
    }
// TODO: implement fetchteColors
  }
}
