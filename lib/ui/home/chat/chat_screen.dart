import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/module/messages_presenter.dart';
import 'package:your_doctor/ui/home/chat/chatmessage.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreentest extends StatefulWidget {
  final String myId;
  final String otherId;
  final String myName;
  final String myImage;
  ChatScreentest({@required this.myId,@required this.otherId,@required this.myName,@required this.myImage});
  @override
  State createState() => new ChatScreenState(myId:myId,otherId: otherId, myName: myName,myImage: myImage);
}

class ChatScreenState extends State<ChatScreentest> with TickerProviderStateMixin implements MessageContract {
  ChatScreenState(
      {@required this.myId, @required this.otherId, @required this.myName, @required this.myImage}) {
    _messagePresenter = new MessagePresenter(this);
  }
  final globalKey = new GlobalKey<ScaffoldState>();

  final String myId;
  final String otherId;
  final String myName;
  final String myImage;

  File imageFile;
  bool isLoading=true;
  bool isLoadingSendMessage=false;

  bool isShowSticker;
  final FocusNode focusNode = new FocusNode();
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messagesWidgets = <ChatMessage>[];
  StreamController _messagesStreamController;
  List<Messages> listMessage = [];
  MessagePresenter _messagePresenter;
  bool isMyMessage;
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();


        AppSharedPreferences.setChatOpen(true);

    focusNode.addListener(onFocusChange);
    isLoading = true;

    print("test sending IDs 1.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= sender id ism $myId And reciever Id is $otherId");

    getMessage();
    _messagePresenter.loadGetMessage(myId, otherId);
    _messagesStreamController = new StreamController();
  }


//==============================================================================
  void getMessage() {

    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg) {
        print(" onLaunch called ${(msg.containsKey("title"))}");
      },
      onResume: (Map<String, dynamic> msg) {
        print(" onResume called ${(msg)}");
      },
      onMessage: (Map<String, dynamic> msg) {

        _handleSubmit(
            msg['data']['message'],
            msg['data']['user_id'],
            msg['data']['image'],
            msg['data']['is_image'],
            "other",
            DateTime.now().timeZoneName
        );
        },
    );
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

  @override
  void dispose() {
    print("dispose was called");
    AppSharedPreferences.setChatOpen(false);
    _chatController.dispose();
    super.dispose();
  }

//==============================================================================
  void _handleSubmit(

      [String text, String senderId ,String imageUrl, String isImg, String name, String date]) {
    print("test sending IDs 4.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= sender id ism $senderId And reciever Id is $myId");

    _chatController.clear();
    ChatMessage message = new ChatMessage(
        userIdSent: senderId,
        formId: myId,
        text: text,
        date: DateTime.now().timeZoneName,
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

  void _onSendMessage(String content, imageUrl,isImg) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      _chatController.clear();

      _messagePresenter.loadSendMessage(content, myId,otherId, imageUrl, isImg);
    setState(() {
      isLoadingSendMessage=true;
    });
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
                onPressed: () =>   _onSendMessage(_chatController.text,"","n")
                ,
                color: Colors.deepOrange,
              ),
            ),
            color: Colors.white,
          ),

          isLoadingSendMessage
                  ? new Center(
                child: new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                ),
              )
                  :Container()
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
    body:  isLoading
        ? new Center(
      child: new CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
      ),
    )
        :  Container(
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
  void onLoadSendingMessageCompleted(EventMessageObject data, String text,
      String sendId, String recieveId, String image, String isImage) {


    setState(() {
      print("test sending IDs 5.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= sender id ism $sendId And reciever Id is $recieveId  and myId is $myId");

      isLoadingSendMessage = false;
      _handleSubmit(text, sendId, image, isImage, myName, DateTime.now().timeZoneName);

     /* switch (data.id) {
        case EventMessageConstants.SEND_SUCCESSFUL:
          {
            setState(() {
              AppSharedPreferences.setUserLoggedIn(true);

              // _callback.onLogIn(true);
              AppSharedPreferences.setUserProfile(data.object);
              var sendFCM;
              if(data.messageResponse==1){
                sendFCM=EventFCM.SEND_SUCCESSFUL;
              }else{
                sendFCM=EventFCM.SEND_FAILED;

              }
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(sendFCM),
              ));

            });
          }
          break;
        case EventMessageConstants.SEND_UN_SUCCESSFUL:
          {
            setState(() {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(EventFCM.SEND_FAILED),
              ));
            });
          }
          break;
        case EventMessageConstants.NO_INTERNET_CONNECTION:
          {
            setState(() {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
              ));

            });
          }
          break;
      }*/
    });
  }

  @override
  void onLoadMessagesCompleted(List<Messages> items) {
    setState(() {
      for (var i = 0; i < items.length; i++) {

        print("value=================================myId is $myId");
        print("value=================================otherId is $otherId");
        print("value=================================contents is ${items[i].text}");
        print("value=================================contents is ${items[i].text}");

        _handleSubmit(
            items[i].text,
            items[i].user_id,
            items[i].imageUrl,
            items[i].imageUrl,
               myName,
            items[i].date);
      }
   print("done================================list message size is ${items.length}");
      isLoading = false;

    });
  }

}