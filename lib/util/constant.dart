import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class APIConstants {
  static const String OCTET_STREAM_ENCODING = "application/octet-stream";

  // static const String API_BASE_URL = "https://hafinse.000webhostapp.com";
  static const String API_BASE_URL = "http://enjezni.com";
  static const String API_LOGIN_URL = "${API_BASE_URL}/login/loginUser.php";
  static const String Api_REGISTER_URL =
      "${API_BASE_URL}/login/registerUser.php";
}

///////////////////////////////////////////////////////////////////////////////
class APIOperations {
  static const String LOGIN = "login";
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";

//------query parameters And Response JSON Messages----------------------------

  static const String ERROR = "error";
  static const String TRUE = "true";
  static const bool FALSE = false;
  static const String SUCCESS = "success";
  static const String SUCCESS_MESSAGE = "success_msg";

  static const String FAILURE = "failure";

  static const String NAME = "name";
  static const String PHONE = "phone";
  static const String PASSWORD = "password";
  static const String IMAGE_URL = "image_url";

  static const String TOKEN = "token";
  static const String LANG = "lang";
  static const String PLACE = "place";
  static const String AREA = "area";
  static const String BUILDING = "building";

  static const String USER = "user";
}

///////////////////////////////////////////////////////////////////////////////
class APIResponse {
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";
  static const String FALSE = "false";
  static const String TRUE = "true";
  static const String SUCCESS = "success";
  static const String FAILURE = "failure";
}

///////////////////////////////////////////////////////////////////////////////
class EventConstants {
  static const int NO_INTERNET_CONNECTION = 0;

///////////////////////////////////////////////////////////////////////////////
  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;

///////////////////////////////////////////////////////////////////////////////
  static const int USER_REGISTRATION_SUCCESSFUL = 502;
  static const int USER_REGISTRATION_UN_SUCCESSFUL = 503;
  static const int USER_ALREADY_REGISTERED = 504;

///////////////////////////////////////////////////////////////////////////////
  static const int CHANGE_PASSWORD_SUCCESSFUL = 505;
  static const int CHANGE_PASSWORD_UN_SUCCESSFUL = 506;
  static const int INVALID_OLD_PASSWORD = 507;
///////////////////////////////////////////////////////////////////////////////
}

///////////////////////////////////////////////////////////////////////////////
class APIResponseCode {
  static const int SC_OK = 200;
}
///////////////////////////////////////////////////////////////////////////////

class SharedPreferenceKeys {
  static const String IS_USER_LOGGED_IN = "IS_USER_LOGGED_IN";
  static const String USER = "USER";
}

///////////////////////////////////////////////////////////////////////////////
class ProgressDialogTitles {
  static const String IN_PROGRESS = "جاري ...";
  static const String USER_LOG_IN = "جاري التسجيل...";
  static const String USER_CHANGE_PASSWORD = "جاري التغيير";
  static const String USER_REGISTER = "جاري التسجيل ...";
}

///////////////////////////////////////////////////////////////////////////////
class SnackBarText {
  static const String NO_INTERNET_CONNECTION = "لا يوجد اتصال !!";
  static const String LOGIN_SUCCESSFUL = "نجحت عملية تسجيل الدخول";
  static const String LOGIN_UN_SUCCESSFUL = "فشل تسجيل الدخول";
  static const String CHANGE_PASSWORD_SUCCESSFUL = "تم تغيير كبمة المرور بنجاح";
  static const String CHANGE_PASSWORD_UN_SUCCESSFUL =
      "فشل عملية تغيير كلمة المرور";
  static const String REGISTER_SUCCESSFUL = "تم التسجيل بنجاح";
  static const String REGISTER_UN_SUCCESSFUL = "فشل عملية التسجيل";
  static const String USER_ALREADY_REGISTERED =
      "الحساب موجود من قبل مستخدم آخر";
  static const String ENTER_PASS = "يرجى ادخال كلمة المرور";
  static const String ENTER_NEW_PASS = "ادخل كلمة المرور الجديدة";
  static const String ENTER_OLD_PASS = "ادخل كلمة المرور القديمة";
  static const String ENTER_EMAIL = "ادخل بريدك الالكتروني";
  static const String ENTER_VALID_MAIL = "ادخل بريدك الالكتروني بشكل صحيح";
  static const String ENTER_NAME = "يرجى ادخال الاسم";
  static const String INVALID_OLD_PASSWORD = "كلمة المرور القديمة خاطئة";
}

///////////////////////////////////////////////////////////////////////////////
class Texts {
  static const String REGISTER_NOW = "حساب جديد ؟";
  static const String LOGIN_NOW = " سجل دخول!";
  static const String LOGIN = "تسجيل دخول";
  static const String REGISTER = "حساب جديد";
  static const String PASSWORD = "كلمة المرور";
  static const String OLD_PASSWORD = "كلمة المرور القديمة";
  static const String NEW_PASSWORD = "كلمة المرور الجديدة";
  static const String CHANGE_PASSWORD = "نغيير كلمة المرور";
  static const String LOGOUT = "تسجيل خروج";
  static const String EMAIL = "البريد الالكتروني";
  static const String NAME = "الاسم";
  static const String RECENTLY = "عُرِض مؤخراٌ";
  static const String CLEAR = "مسح";
  static const String ForgotPasswordMsg =
      " قم بادخال عنوان البريد الالكتروني \n سيتم ارسال رابط اعادة ضبط كلمة المرور الى بريدك الالكتروني";
  static const String ForgotPassword = "نسيت كلمة المرور ؟";

  static const String SEARCH = "بحث متقدم";
}
////////////////////////////////////////////

class ThemeColors {
  static const Color PrimaryColor_Dark = Color(0xff003B55);
  static const Color PrimaryColor = Color(0xff005A82);
  static const Color PrimaryColor60 = Color(0xff007EB7);

  static const Color white100 = Color(0xffffffff);
  static const Color white80 = Color(0xbbffffff);
  static const Color white60 = Color(0x99ffffff);
  static const Color white40 = Color(0x44ffffff);
  static const Color white22 = Color(0x22ffffff);
  static const Color Material_Accent_Color = Colors.teal;
  static const Color AccentColor = Color(0xff00BABB);
  static const Color ShadowColor = Color(0x44000000);
  static const CanvasColor = Color(0xff005A82);

  ///gradient Canvas Color /////
  static BoxDecoration Canvas = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment(0, 1), //
      colors: [const Color(0xFF003B55), const Color(0xaa005B5B)],
      tileMode: TileMode.clamp,
    ),
  );

  /// ====================================

}
///////////////////////////////////////////////////
