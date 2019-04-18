import 'dart:io';

import 'package:your_doctor/data/user/base/event_object.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class RegisterUserContract {
  void onLoadRegisterCompleted(EventObject data);

  void onLoadRegisterError();
}

class RegisterPresenter {
  RegisterUserContract _view;
  RegisterUserRepository _repository;

  RegisterPresenter(this._view) {
    _repository = new Injector().regisetrRepository;
  }

  void loadRegister(
      String name,
      String emailId,
      String imgUrl,
      String phone,
      String password,
      String place,
      String area,
      String building,
      String token,
      String lang) {
    _repository
        .fetchRegisteringUser(name, emailId, imgUrl, phone, password, place,
            area, building, token, lang)
        .then((c) => _view.onLoadRegisterCompleted(c))
        .catchError((onError) => _view.onLoadRegisterError());
  }
}
