import 'dart:async';

import 'package:your_doctor/data/doctors/doctors_data.dart';

class MockDoctorsRepository implements DoctorsRepository {
  @override
  Future<List<Doctors>> fetchAllDoctors() {
    // TODO: implement fetch Categories
    return new Future.value(data);
  }
}

var data = <Doctors>[
  new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
        "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ),
  new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ), new Doctors(
    id: "1",
    dr_name: "ahmed",
    specialty: "Bons",
    doctor_img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",

  ),

];
