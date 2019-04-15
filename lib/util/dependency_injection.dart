

import 'package:your_doctor/data/user/login_data_prod.dart';
import 'package:your_doctor/data/user/register_data_prod.dart';
import 'package:your_doctor/data/user/reset_password_prod.dart';
import 'package:your_doctor/data/user/user_data.dart';

enum Flavor { MOCK, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;


  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();


//TODO========|==Get All Wanted Data From Repositories Classes===|==============
//TODO        v                                                  v

////////////////////////////////////////////////////////////////////////////////
  LogInUserRepository get logInRepository {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new ProdLogInRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }

////////////////////////////////////////////////////////////////////////////////
  RegisterUserRepository get regisetrRepository {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new ProdRegisterRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }

////////////////////////////////////////////////////////////////////////////////
  ResetPasswordRepository get resetPasswordRepository {
    return ResetPassword();
  }
}
