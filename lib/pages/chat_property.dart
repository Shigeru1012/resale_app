import 'dart:convert';
import 'package:resale_app/model/properties_model.dart';
import 'package:flutter/material.dart';
import 'package:resale_app/model/message_model.dart';
import 'package:resale_app/model/chat_model.dart';
import 'package:http/http.dart' as http;

class ChatProperty extends StatefulWidget {
  final Data senders;

  const ChatProperty({Key? key, required this.senders}) : super(key: key);

  @override
  _ChatPropertyState createState() => _ChatPropertyState();
}

class _ChatPropertyState extends State<ChatProperty> {

  Future<List<DataChat>> getData() async {
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuaW5ndXllbiIsImV4cCI6MTY3Mzk1NTUwMiwiaWF0IjoxNjczOTQ2NTAyfQ.IDuAlkSIAmb39vk7sdYH0Eqx9a8KIB828HAukDs8L-pMg8w9Yd3haWaevRFt2he_IZunSAeVcJzvVqGNC-ar5w'};
    var response = await http.get(Uri.parse('https://agency-app-final.herokuapp.com/messages/${widget.senders.conversationId}'), headers: headers);

    var jsonData = jsonDecode(response.body.toString());
    var jsonList = jsonData['data'];
    List<DataChat> chats = [];

    if (response.statusCode == 200) {
      for ( var jsonDataList in jsonList) {
        DataChat datalist = DataChat.fromJson(jsonDataList);
        chats.add(datalist);
      }
      return chats;
    } else {
      return chats;
    }
  }

  _buildMessage(DataChat message, bool isMe) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
      )
          : EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        right: 80.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).backgroundColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        )
            : const BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.created!,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.message!,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [Color(0xFFf85187), Color(0xFF3ac3cb)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            widget.senders.userName.toString(),
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<DataChat>>(
                  future: getData(),
                  builder: (context, AsyncSnapshot<List<DataChat>> snapshot){
                    if (snapshot.data == null) {
                      return const Center( child: CircularProgressIndicator(),);
                    } else {
                      List<DataChat> chats = snapshot.data!;
                      return ListView.builder(
                          reverse: true,
                          padding: const EdgeInsets.only(top: 15.0),
                          itemCount: chats.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = chats.length - 1 - index;
                            final DataChat message = chats[reverseIndex];
                            final bool isMe = message.senderName.toString() == 'ninguyen';
                            return _buildMessage(message, isMe);
                          }
                      );
                    }
                  }
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}