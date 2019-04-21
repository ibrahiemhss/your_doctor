import 'package:your_doctor/util/constant.dart';

class EventMessageObject {
  int id;
  String messageResponse;
  Object object;

  EventMessageObject(
      {this.id: EventMessageConstants.NO_INTERNET_CONNECTION,this.messageResponse, this.object: null});
}
