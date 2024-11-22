import 'package:flutter/material.dart';


abstract class ExitDialogCallbacks {
  onExit();
}

abstract class LogoutDialogCallbacks {
  onClickYes();

  onClickCancel();
}



abstract class GeneralSingleButtonCallbacks {
  onTapButton();
}


abstract class AppErrorCallback {
  onErrorCall();
}

abstract class AppNetworkCallback {
  onRetry();
}

abstract class RetryLogin {
  retryLogin();
}




