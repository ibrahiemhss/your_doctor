import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_doctor/data/articles/articles_data.dart';

import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';

class ProdMessagesRepository implements GetMessagesRepository {
  @override
  Future<List<Messages>> getMessages(int id,int otherId) async{

    var queryParameters = {
      APIOperations.USER_ID: id.toString(),
      APIOperations.OTHER_ID: otherId.toString(),


    };
    var response = await http.post(Uri.encodeFull(APIConstants.Api_GET_MESSAGES_URL),
        body: queryParameters, headers: {"Accept": "application/json"});

    List data = new List();

    try{
      var responseBody = json.decode(response.body);
      data = responseBody["users"];
      print("Decoded 2: $responseBody");
    } catch(e) {
      print("Error: $e");
    }

    final statusCode = response.statusCode;
    if (statusCode != 200 || data == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }else{
      return (data as List)
          .map((c) => new Messages.fromJson(c))
          .toList();
    }

  }
}