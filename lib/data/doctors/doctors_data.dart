import 'dart:async';

class Doctors {
  String id;
  String dr_name;
  String doctor_img;
  String specialty;


  Doctors(
      {this.id,
      this.dr_name,
      this.specialty,
      this.doctor_img,
     });

  factory Doctors.fromJson(Map<String, dynamic> json) {
    return new Doctors(
      id: json['id'].toString(),
      dr_name: json['dr_name'].toString(),
      specialty: json['specialty'].toString(),
      doctor_img: json['doctor_img'].toString(),
    );
  }

  Doctors.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        dr_name = map['dr_name'],
        specialty = map['specialty'],
        doctor_img = map['doctor_img'];
}

abstract class DoctorsRepository {
  Future<List<Doctors>> fetchAllDoctors();
}


abstract class SelctedDoctorsRepository {
  Future<List<Doctors>> fetchSelctedDoctors(String id);
}

abstract class DoctorDetailRepository {
  Future<Doctors> fetchDoctotDetails(String id);
}
class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
