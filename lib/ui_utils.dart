import 'package:evently/app_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils {
  static void showSuccessMessage(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: AppTheme.primaryDark,
      textColor: AppTheme.white,
    );
  }

  static void showErrorMessage([String? massage]) {
    Fluttertoast.showToast(
      msg: massage ?? 'Something went wrong',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: AppTheme.red,
      textColor: AppTheme.black,
    );
  }
}
