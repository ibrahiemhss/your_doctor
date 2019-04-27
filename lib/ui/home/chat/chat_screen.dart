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
  final String dr_Id;
  final String myName;
  final String myImage;
  ChatScreentest({@required this.myId,@required this.dr_Id,@required this.myName,@required this.myImage});
  @override
  State createState() => new ChatScreenState(myId:myId,dr_Id: dr_Id, myName: myName,myImage: myImage);
}

class ChatScreenState extends State<ChatScreentest> with TickerProviderStateMixin implements MessageContract {
  ChatScreenState(
      {@required this.myId, @required this.dr_Id, @required this.myName, @required this.myImage}) {
    _messagePresenter = new MessagePresenter(this);
  }
  final globalKey = new GlobalKey<ScaffoldState>();

  final String myId;
  final String dr_Id;
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


      //  AppSharedPreferences.setChatOpen(true);

    focusNode.addListener(onFocusChange);
    isLoading = true;

    print("test sending IDs 1.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= sender id ism $myId And reciever Id is $dr_Id");

    getMessage();
    _messagePresenter.loadGetMessage(myId, dr_Id);
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
       // [String msg_from, String user_name , String msg_content, String isImage, String msg_created_at]) {

        _handleSubmit(
            msg['data']['msg_from'],
            msg['data']['user_name'],
            msg['data']['msg_content'],
            msg['data']['is_image'],
            msg['data']['msg_created_at']);
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
   // AppSharedPreferences.setChatOpen(false);
    _chatController.dispose();
    super.dispose();
  }

//==============================================================================
  void _handleSubmit(
  [String msg_from, String user_name , String msg_content, String isImage, String msg_created_at]) {

    _chatController.clear();
    ChatMessage message = new ChatMessage(
        user_msg_id: msg_from,
        my_id: myId,
        msg_content: msg_content,
        date:msg_created_at,
        name: user_name,
        isImage: isImage);
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

  void _onSendMessage(String msg_content,isImage,String msg_created_at) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (msg_content.trim() != '') {
      _chatController.clear();

    setState(() {
      _messagePresenter.loadSendMessage(myId, dr_Id,
           myName, msg_content, "not asocaited yet",   isImage, msg_created_at);
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
                onPressed: () =>   _onSendMessage(_chatController.text,"n",DateTime.now().timeZoneName)
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
  void onLoadSendingMessageCompleted(EventMessageObject data,
      String msg_content,String msg_from, String msg_to,String isImage,String msg_created_at) {




    setState(() {
      print("test msg_from IDs 5.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= msg_from id ism $msg_from And msg_to Id is $msg_to  and myId is $myId");

      isLoadingSendMessage = false;
      _handleSubmit(msg_content, msg_from, isImage, myName, msg_created_at);

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
        print("value=================================otherId is $dr_Id");
        print("value=================================contents is ${items[i].msg_content}");

        _handleSubmit(
            items[i].msg_from,
            items[i].user_name,
            items[i].msg_content,
            items[i].isImage,
            items[i].msg_created_at);
      }
   print("done================================list message size is ${items.length}");
      isLoading = false;

    });
  }

}