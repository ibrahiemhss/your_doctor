import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/internet/api_message_request.dart';
import 'package:your_doctor/data/chat/internet/api_message_response.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/constant.dart';

class MockSendMessageRepository implements SendingMessageRepository {
  @override
  Future<EventMessageObject> sendMessage(String sender_id, String receiver_id,
      String sender_name, String reciver_name,String msg_content,String msg_pic_file,  String isImage,String msg_created_at)
  async {
    // TODO: implement sendMessage
    var queryParameters = {
      APIOperations.SENDER_ID: sender_id,
      APIOperations.RECEVER_ID: receiver_id,
      APIOperations.MSG_SENDER_NAME: sender_name,
      APIOperations.MSG_CONTENT: msg_content,
      APIOperations.MSG_PIC: msg_pic_file,
      APIOperations.MSG_IS_IMAGE: isImage,
      APIOperations.CREATED_AT: "",

    };

    ApiMessageRequest apiRequest = new ApiMessageRequest();
    Messages messages = new Messages(sender_id: sender_id,receiver_id: receiver_id,msg_content: msg_content,isImage: isImage);
    print("test sender_id IDs 3.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= msg_from id ism $sender_id And receiver_id Id is $receiver_id");

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
