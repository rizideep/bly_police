import 'app_constant.dart';

class Validator {
 static bool validateEmail(String value) {
    RegExp regExp = RegExp(AppConstant.validEmail);
    if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

 static bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    } else if (value.length < 4) {
      return false;
    } else {
      return true;
    }
  }
}
