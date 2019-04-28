import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class MessageContract {
  void onLoadSendingMessageCompleted(EventMessageObject item,
      String msg_content,String msg_from, String msg_to,String isImage,String msg_created_at);

  void onLoadMessagesCompleted(List<Messages> items);

  void onLoadMessagesError();
}

class MessagePresenter {
  MessageContract _view;
  SendingMessageRepository _sendRepository;
  GetMessagesRepository _getMessagesRepository;

  MessagePresenter(this._view) {
    _getMessagesRepository = new Injector().getMessages;
    _sendRepository = new Injector().senMessageRepsitory;
  }
 // [String text, int id, String imageUrl, String isImg, String name) {

  void loadSendMessage(String sender_id, String receiver_id,
  String sender_name, String reciver_name,String msg_content,String msg_pic_file,  String isImage,String msg_created_at) {

    print("test sender_id IDs 2.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= msg_from id ism $sender_id And receiver_id Id is $receiver_id");
//sender_id,,,,,receiver_id
    _sendRepository
        .sendMessage( sender_id,  receiver_id,
        sender_name,reciver_name, msg_content, msg_pic_file,   isImage, msg_created_at)
        .then((c) => _view.onLoadSendingMessageCompleted(c,msg_content, sender_id, receiver_id,isImage,msg_created_at))
        .catchError((onError) => _view.onLoadMessagesError());
  }

  void loadGetMessage(String sender_id, String receiver_id) {
    _getMessagesRepository
        .getMessages(sender_id,receiver_id)
        .then((c) => _view.onLoadMessagesCompleted(c))
        .catchError((onError) => _view.onLoadMessagesError());
  }
}
