import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class ResetPasswordContract {
  void onLoadResetPasswordCompleted(EventUserObject data);

  void onLoadResetPasswordError();
}

class RegisterPresenter {
  ResetPasswordContract _view;
  ResetPasswordRepository _repository;

  RegisterPresenter(this._view) {
    _repository = new Injector().resetPasswordRepository;
  }

  void loadResetPassword(String name, String emailId, String password) {
    _repository
        .fetchResetingPassword(name, emailId, password)
        .then((c) => _view.onLoadResetPasswordCompleted(c))
        .catchError((onError) => _view.onLoadResetPasswordError());
  }
}
