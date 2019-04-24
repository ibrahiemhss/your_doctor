import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/internet/api_message_request.dart';
import 'package:your_doctor/data/chat/internet/api_message_response.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/data/doctors/doctors_data.dart';
import 'package:your_doctor/util/constant.dart';

class MockSendMessageRepository implements SendingMessageRepository {
  @override
  Future<EventMessageObject> sendMessage(String id,String to, String text) async{
    // TODO: implement sendMessage
    var queryParameters = {
      APIOperations.NAME: to,
      APIOperations.MESSAGE_BODY: text,
    };
    ApiMessageRequest apiRequest = new ApiMessageRequest();
    Messages messages = new Messages(
        id: id,
        text: text);

    apiRequest.operation = APIOperations.SEND_MESSAGE;
    apiRequest.message = messages;

    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post(APIConstants.API_LOGIN_URL,
          body: queryParameters, encoding: Encoding.getByName(encoding));
      if (response != null) {
        if (response.statusCode == APIResponseCode.SC_OK &&
            response.body != null) {
          final responseJson = json.decode(response.body);
          ApiMessageResponse apiResponse = ApiMessageResponse.fromJson(responseJson);
          if (apiResponse.message == APIOperations.SUCCESS) {
            return new EventMessageObject(
                id: EventMessageConstants.SEND_SUCCESSFUL,messageResponse: apiResponse.message,
                object: apiResponse.message);
          } else {
            return new EventMessageObject(id: EventMessageConstants.SEND_UN_SUCCESSFUL,messageResponse: apiResponse.message);
          }
        } else {
          return new EventMessageObject(id: EventMessageConstants.SEND_UN_SUCCESSFUL);
        }
      } else {
        return new EventMessageObject();
      }
    } catch (Exception) {
      print("errorIn LogIn =========>============>=========>is => ${Exception.toString()}");

      return EventMessageObject();
    }
  }




// TODO: implement fetchteColors

}

