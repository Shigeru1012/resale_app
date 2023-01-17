import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/add_messages.dart';

class MessageProvider extends ChangeNotifier {
  final httpClient = http.Client();

  Map<String, String> customheaders = {
    "Accept" : "application/json",
    "Content-Type" : "application/json;charset=UTF-8",
    'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuaW5ndXllbiIsImV4cCI6MTY3Mzk1NTUwMiwiaWF0IjoxNjczOTQ2NTAyfQ.IDuAlkSIAmb39vk7sdYH0Eqx9a8KIB828HAukDs8L-pMg8w9Yd3haWaevRFt2he_IZunSAeVcJzvVqGNC-ar5w'
  };

  Future fetchData() async {
    final Uri restAPI = Uri.parse('https://agency-app-final.herokuapp.com/messages/send?sender_id=1&conversation_id=1');
    http.Response response = await httpClient.post(restAPI, headers: customheaders);
    final Map parsedData = await json.decode(response.body.toString());
    var messageData = parsedData['data'];
    print(messageData);
  }

  Future addMessage(Map<String, String> body) async {
    final Uri restAPI2 = Uri.parse('https://agency-app-final.herokuapp.com/messages/send?sender_id=1&conversation_id=1');
    http.Response response = await httpClient.post(restAPI2, headers: customheaders, body: jsonEncode(body));
    final Map parsedData = await json.decode(response.body.toString());
    var messageData = parsedData['data'];
    List<AddChat> chats = [];

    if (response.statusCode == 200) {
      for ( var jsonDataList in messageData) {
        AddChat datalist = AddChat.fromJson(jsonDataList);
        chats.add(datalist);
      }
      return chats;
    } else {
      return chats;
    }
  }
}