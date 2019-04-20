import 'package:your_doctor/data/doctors/doctors_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class DoctorsContract {
  void onLoadDoctorsCompleted(List<Doctors> items);

  void onLoadDoctorsError();
}

class DoctorsPresenter {
  DoctorsContract _all_doctors_view;
  DoctorsRepository _all_doctors_repository;
  SelctedDoctorsRepository _selcted_doctors_repository;

  DoctorsPresenter(this._all_doctors_view) {
    _all_doctors_repository = new Injector().doctorsRepository;
    _selcted_doctors_repository = new Injector().selcteddoctorsRepository;

  }

  void loadAllDoctors() {
    _all_doctors_repository
        .fetchAllDoctors()
        .then((c) => _all_doctors_view.onLoadDoctorsCompleted(c))
        .catchError((onError) => _all_doctors_view.onLoadDoctorsError());
  }

  void loadSelctedDoctors(String id) {
    _selcted_doctors_repository
        .fetchSelctedDoctors(id)
        .then((c) => _all_doctors_view.onLoadDoctorsCompleted(c))
        .catchError((onError) => _all_doctors_view.onLoadDoctorsError());
  }
}