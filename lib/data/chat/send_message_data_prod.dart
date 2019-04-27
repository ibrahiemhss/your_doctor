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
  String msg_from, String msg_to,
  String msg_uder_name,String msg_content,String msg_pic_file,  String isImage,String msg_created_at)
  async {
    // TODO: implement sendMessage
    var queryParameters = {
      APIOperations.MSG_FROM: msg_from,
      APIOperations.MSG_TO: msg_to,
      APIOperations.MSG_USER_NAME: msg_content,
      APIOperations.MSG_CONTENT: msg_content,
      APIOperations.MSG_PIC: msg_pic_file,
      APIOperations.MSG_IS_IMAGE: isImage,
      APIOperations.MSG_CREATED_AT: msg_created_at,

    };

    ApiMessageRequest apiRequest = new ApiMessageRequest();
    Messages messages = new Messages(msg_from: msg_from,msg_to: msg_to,msg_content: msg_content,isImage: isImage);
    print("test msg_from IDs 3.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= msg_from id ism $msg_from And msg_to Id is $msg_to");

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
