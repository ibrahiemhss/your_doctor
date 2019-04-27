import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_doctor/data/articles/articles_data.dart';

import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/constant.dart';


class ProdMessagesRepository implements GetMessagesRepository {
  @override
  Future<List<Messages>> getMessages(String msg_from, String msg_to) async {
    var response = await http.post(Uri.encodeFull(APIConstants.Api_GET_MESSAGES_URL), body: {
      APIOperations.MSG_FROM: msg_from,
      APIOperations.MSG_TO: msg_to,
    }, headers: {
      "Accept": "application/json"
    });
    var responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody["chat"] == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }else{
      return (responseBody["chat"] as List)
          .map((c) => new Messages.fromJson(c))
          .toList();
    }


  }
}

