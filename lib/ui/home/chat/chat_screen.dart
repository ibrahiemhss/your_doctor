import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/module/messages_presenter.dart';
import 'package:your_doctor/ui/home/chat/chatmessage.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreentest extends StatefulWidget {
  final int myId;
  final int otherId;
  final String myName;
  final String myImage;
  ChatScreentest({@required this.myId,@required this.otherId,@required this.myName,@required this.myImage});
  @override
  State createState() => new ChatScreenState(myId:myId,otherId: otherId, myName: myName,myImage: myImage);
}

class ChatScreenState extends State<ChatScreentest> implements MessageContract {
  ChatScreenState(
      {@required this.myId, @required this.otherId, @required this.myName, @required this.myImage}) {
    _messagePresenter = new MessagePresenter(this);
  }

  final int myId;
  final int otherId;
  final String myName;
  final String myImage;


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
  bool isMyMessage;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);
    isImage = false;
    isLoading = true;

    _messagePresenter.loadGetMessage(myId, otherId);
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
      [String text, int id, String imageUrl, String isImg, String name, String date]) {
    _chatController.clear();
    ChatMessage message = new ChatMessage(
        id: id,
        formId: myId,
        text: text,
        date: date,
        name: name,
        isImage: isImg,
        imageUrl: imageUrl);
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
    String fileName = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
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
 // _handleSubmit(_chatController.text, myId, "",isImage, "ibrahim", "this/// is/// date");
  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Button send image
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.image),
                onPressed: getImage,
                color: Colors.yellow,
              ),
            ),
            color: Colors.white,
          ),
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
                //onPressed: getSticker,
                //color: primaryColor,
              ),
            ),
            color: Colors.white,
          ),

          // Edit text
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
                controller: _chatController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(
                      color:      Colors.black,),
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
                onPressed: () =>   _handleSubmit(_chatController.text, myId, "","false", myName, "this/// is/// date")
                ,
                color: Colors.deepOrange,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border:
          new Border(top: new BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
    );
  }

//==============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
    body:  Container(
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
              color: Theme
                  .of(context)
                  .cardColor,
            ),
            child:
//------------------------------------------------------------------------------
            buildInput(),
//------------------------------------------------------------------------------

          )
        ],
      ),
    ));
  }
  Widget appBar() {
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }
      assert(false);
      return null;
    }

    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(_backIcon()),
        color: Colors.white,
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text("your dotor"),
      backgroundColor: ThemeColors.CanvasColor,
    );
  }

  @override
  void onLoadMessagesError() {
    // TODO: implement onLoadMessagesError
  }

  @override
  void onLoadSendingMessageCompleted(EventMessageObject item) {
    // TODO: implement onLoadSendingMessageCompleted
  }

  @override
  void onLoadMessagesCompleted(List<Messages> items) {
    setState(() {
      for (var i = 0; i < items.length; i++) {

        print("value=================================myId is $myId");
        print("value=================================otherId is $otherId");
        print("value=================================contents is ${items[i].text}");
        print("value=================================id is ${items[i].id}");
        print("value=================================contents is ${items[i].text}");

        _handleSubmit(
            items[i].text, items[i].id, items[i].imageUrl, items[i].isImage);
      }
      isLoading = false;
    });
  }
}