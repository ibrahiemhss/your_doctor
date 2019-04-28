import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/data/user/internet/api_user_request.dart';
import 'package:your_doctor/data/user/internet/api_user_response.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

class ProdRegisterRepository implements RegisterUserRepository {
  @override
  Future<EventUserObject> fetchRegisteringUser(
      String name,
      String emailId,
      String imgUrl,
      String phone,
      String password,
      String place,
      String token,
      String lang) async {
    // TODO: implement fetchUser
    var queryParameters = {
      APIOperations.NAME: name,
      APIOperations.EMAIL: emailId,
      APIOperations.PHONE: phone,
      APIOperations.PASSWORD: password,
      APIOperations.PLACE: place,
      APIOperations.TOKEN: token,
      APIOperations.LANG: lang,
    };
    ApiUserRequest apiRequest = new ApiUserRequest();
    User user = new User(
      id:1,
        name: name,
        email: emailId,
        phone: int.parse(phone),
        token: token,
        password: password);

    apiRequest.operation = APIOperations.REGISTER;
    apiRequest.user = user;
    if(user!=null){
      try {
        final encoding = APIConstants.OCTET_STREAM_ENCODING;
        final response = await http.post(APIConstants.Api_REGISTER_URL,
            body: queryParameters, encoding: Encoding.getByName(encoding));
        if (response != null) {
          if (response.statusCode == APIResponseCode.SC_OK &&
              response.body != null) {
            final responseJson = json.decode(response.body);
            ApiUserResponse apiResponse = ApiUserResponse.fromJson(responseJson);
            if (apiResponse.error == false) {
              return new EventUserObject(
                  id: EventUserConstants.USER_REGISTRATION_SUCCESSFUL,
                  object: null);
            } else if (apiResponse.message == APIOperations.FAILURE) {
              return new EventUserObject(
                  id: EventUserConstants.USER_ALREADY_REGISTERED);
            } else {
              return new EventUserObject(
                id: EventUserConstants.USER_REGISTRATION_UN_SUCCESSFUL,
              );
            }
          } else {
            return new EventUserObject(
                id: EventUserConstants.USER_REGISTRATION_UN_SUCCESSFUL);
          }
        } else {
          return new EventUserObject();
        }
      } catch (Exception) {
        print(
            "errorIn Register =========>============>=========>is => ${Exception.toString()}");
        return EventUserObject();
      }
    }

// TODO: implement fetchteColors
  }
}
