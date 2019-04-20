import 'package:your_doctor/util/constant.dart';

class EventObject {
  int id;
  String messageResponse;

  Object object;

  EventObject(
      {this.id: EventConstants.NO_INTERNET_CONNECTION,this.messageResponse, this.object: null});
}
