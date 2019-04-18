import 'package:your_doctor/data/user/base/event_object.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class LogInContract {
  void onLoadLogInCompleted(EventObject data);

  void onLoadLogIngError();
}

class LogInPresenter {
  LogInContract _view;
  LogInUserRepository _repository;

  LogInPresenter(this._view) {
    _repository = new Injector().logInRepository;
  }

  void loadLogIn(String emailId, String password) {
    _repository
        .fetchLogInUser(emailId, password, "uu", "uu", "")
        .then((c) => _view.onLoadLogInCompleted(c))
        .catchError((onError) => _view.onLoadLogIngError());
  }
}
