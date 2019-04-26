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
  Future<EventMessageObject> sendMessage(
      String text,String sendId, String recieveId,  String image,String isImage) async {
    // TODO: implement sendMessage
    var queryParameters = {
      APIOperations.USER_ID: sendId,
      APIOperations.RECIEVE_ID: recieveId,
      APIOperations.MESSAGE: text,
      APIOperations.IS_IMAGE: isImage,
      APIOperations.IMAGE: image,

    };
    ApiMessageRequest apiRequest = new ApiMessageRequest();
    Messages messages = new Messages(user_id: sendId,otherId: recieveId,text: text,imageUrl: image,isImage: isImage);
    print("test sending IDs 3.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= sender id ism $sendId And reciever Id is $recieveId");

        //id: id,
      //  text: text);

    apiRequest.operation = APIOperations.SEND_MESSAGE;
    apiRequest.message = messages;

    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post(APIConstants.Api_SEND_MESSAGE_URL,
          body: queryParameters, encoding: Encoding.getByName(encoding));
      if (response != null) {
        if (response.statusCode == APIResponseCode.SC_OK &&
            response.body != null) {
          final responseJson = json.decode(response.body);
          ApiMessageResponse apiResponse =
              ApiMessageResponse.fromJson(responseJson);
          if (apiResponse.message ==1) {
            return new EventMessageObject(
                id: EventMessageConstants.SEND_SUCCESSFUL,
                messageResponse: apiResponse.message,
                object: apiResponse.message);
          } else {
            return new EventMessageObject(
                id: EventMessageConstants.SEND_UN_SUCCESSFUL,
                messageResponse: apiResponse.message);
          }
        } else {
          return new EventMessageObject(
              id: EventMessageConstants.SEND_UN_SUCCESSFUL);
        }
      } else {
        return new EventMessageObject();
      }
    } catch (Exception) {
      print(
          "errorIn SendMessage =========>============>=========>is => ${Exception.toString()}");

      return EventMessageObject();
    }
  }

// TODO: implement fetchteColors

}
