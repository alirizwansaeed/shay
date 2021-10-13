import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Dialogs {
  static Future<void> errorDialog(String message)async {
   await Get.defaultDialog(
      title: 'Exception',
      textCancel: 'Ok',
      content: Text(message),
    );
  }
  static Future<void> successDialog(String message)async {
   await Get.defaultDialog(
      title: 'Success',
      textCancel: 'Ok',
      content: Text(message),
    );
  }

  static void loading() {
    BotToast.showLoading(backButtonBehavior: BackButtonBehavior.ignore);
  }
  static void closeLoading() {
    BotToast.closeAllLoading();
  }

 static  Future<void> toast(String message) async {
    BotToast.showText(text: message);
  }
}
