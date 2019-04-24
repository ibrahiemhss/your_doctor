import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/module/messages_presenter.dart';
import 'package:your_doctor/ui/home/chat/chatmessage.dart';
import 'package:your_doctor/util/constant.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreentest extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreentest> implements MessageContract {
  ChatScreenState() {
    _messagePresenter = new MessagePresenter(this);
  }

  File imageFile;
  bool isLoading;
  bool isImage;
  bool isShowSticker;
  final FocusNode focusNode = new FocusNode();
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messagesWidgets = <ChatMessage>[];
  StreamController _messagesStreamController;
  List<Messages> listMessage = [];
  MessagePresenter _messagePresenter;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);
    isImage = false;
    isLoading = true;
    _messagePresenter.loadGetMessage("1");
    _messagesStreamController = new StreamController();
  }

//==============================================================================

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        isShowSticker = false;
      });
    }
  }


//==============================================================================

  void _handleSubmit(
      [String text,
      String imageUrl,
      bool isImg,
      String name,
      bool isMe,
      String id,
      String date]) {
    _chatController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      isMe: isMe,
      id: id,
      date: date,
      name: name,
      isImage: isImg,
      imageUrl: imageUrl,
    );
    setState(() {
      _messagesWidgets.insert(0, message);
    });
  }

//==============================================================================
  Future getImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      setState(() {
        isLoading = true;
      });
      uploadFile();
    }
  }

  Future uploadFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    //StorageUploadTask uploadTask = reference.putFile(imageFile);
    // StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    /* storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
      imageUrl = downloadUrl;
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, 1);
      });
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: 'This file is not an image');
    });*/
  }

  void onSendMessage(String content, int type) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      _chatController.clear();

      /* var documentReference = Firestore.instance
          .collection('messages')
          .document(groupChatId)
          .collection(groupChatId)
          .document(DateTime.now().millisecondsSinceEpoch.toString());

      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            'idFrom': id,
            'idTo': peerId,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            'content': content,
            'type': type
          },
        );
      });*/
      // _messagesStreamController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }


//==============================================================================

  Widget _chatEnvironment() {
    return Container(
      child: Row(
        children: <Widget>[

//------------------- Button send image-----------------------------------------
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.image),
                onPressed: getImage,
                color: ThemeColors.ShadowColor,
              ),
            ),
            color: Colors.white,
          ),

//------------------- Button send IMOJE-----------------------------------------

          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
                // onPressed: getSticker,
                color: ThemeColors.ShadowColor,
              ),
            ),
            color: Colors.white,
          ),

//------------------- Edit text-------------------------------------------------

          Flexible(
            child: Container(
              child: TextField(
                style:
                    TextStyle(color: ThemeColors.PrimaryColor, fontSize: 15.0),
                controller: _chatController,
                onSubmitted: _handleSubmit,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: ThemeColors.ShadowColor),
                ),
                focusNode: focusNode,
              ),
            ),
          ),

          // Button send message
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmit(_chatController.text, "",
                    isImage, "ibrahim", true, "4", "this/// is/// date"),
                color: ThemeColors.PrimaryColor,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: ThemeColors.PrimaryColor, width: 0.5)),
          color: Colors.white),
    );
  }

//==============================================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeColors.Canvas,
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messagesWidgets[index],
              itemCount: _messagesWidgets.length,
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child:
//------------------------------------------------------------------------------
            _chatEnvironment(),
//------------------------------------------------------------------------------

          )
        ],
      ),
    );
  }

  @override
  void onLoadMessagesCompleted(List<Messages> items) {
    setState(() {
      for (var i = 0; i < items.length; i++) {
        _handleSubmit(items[i].text, items[i].imageUrl, items[i].isImage,
            items[i].name, items[i].isMe, items[i].id, items[i].timeStamp);
      }
      isLoading = false;
    });
  }

  @override
  void onLoadMessagesError() {
    // TODO: implement onLoadMessagesError
  }

  @override
  void onLoadSendingMessageCompleted(EventMessageObject item) {
    // TODO: implement onLoadSendingMessageCompleted
  }
}
