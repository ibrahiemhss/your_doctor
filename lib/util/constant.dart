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
  static const String IN_PROGRESS = "In Progress...";
  static const String USER_LOG_IN = "Logging In...";
  static const String USER_CHANGE_PASSWORD = "Changing...";
  static const String USER_REGISTER = "Registering...";
}

///////////////////////////////////////////////////////////////////////////////
class SnackBarText {
  static const String NO_INTERNET_CONNECTION = "No Internet Conenction";
  static const String LOGIN_SUCCESSFUL = "Login Successful";
  static const String LOGIN_UN_SUCCESSFUL = "Login Un Successful";
  static const String CHANGE_PASSWORD_SUCCESSFUL = "Change Password Successful";
  static const String CHANGE_PASSWORD_UN_SUCCESSFUL =
      "Change Password Un Successful";
  static const String REGISTER_SUCCESSFUL = "Register Successful";
  static const String REGISTER_UN_SUCCESSFUL = "Register Un Successful";
  static const String USER_ALREADY_REGISTERED = "User Already Registered";
  static const String ENTER_PASS = "Please Enter your Password";
  static const String ENTER_NEW_PASS = "Please Enter your New Password";
  static const String ENTER_OLD_PASS = "Please Enter your Old Password";
  static const String ENTER_EMAIL = "Please Enter your Email Id";
  static const String ENTER_VALID_MAIL = "Please Enter Valid Email Id";
  static const String ENTER_NAME = "Please Enter your Name";
  static const String INVALID_OLD_PASSWORD = "Invalid Old Password";
}

///////////////////////////////////////////////////////////////////////////////
class Texts {
  static const String REGISTER_NOW = "Register Now !";
  static const String LOGIN_NOW = " Login Now !";
  static const String LOGIN = "LOGIN";
  static const String REGISTER = "REGISTER";
  static const String PASSWORD = "Password";
  static const String OLD_PASSWORD = "Old Password";
  static const String NEW_PASSWORD = "New Password";
  static const String CHANGE_PASSWORD = "CHANGE PASSWORD";
  static const String LOGOUT = "LOGOUT";
  static const String EMAIL = "Email";
  static const String NAME = "Name";
  static const String RECENTLY = "RECENTLY VIEWED";
  static const String CLEAR = "CLEAR";

}
////////////////////////////////////////////

class ThemeColors {
  static const Color PrimaryColor_Dark = Color(0xff003B55);
  static const Color PrimaryColor = Color(0xff005A82);
  static const Color PrimaryColor60 = Color(0xff007EB7);

  static const Color white100 = Color(0xffffffff);
  static const Color white80 = Color(0xbbffffff);
  static const Color white60 = Color(0x99ffffff);
  static const Color white33 = Color(0x44ffffff);
  static const Color Material_Accent_Color = Colors.teal;
  static const Color AccentColor = Color(0xff00BABB);
  static const Color ShadowColor = Color(0x44000000);
  static const CanvasColor =Color(0xff005A82);


         ///gradient Canvas Color /////
  static  BoxDecoration Canvas = BoxDecoration(
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
