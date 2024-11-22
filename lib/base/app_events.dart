class AppEvent {}

class InitialEvent extends AppEvent {}

class LoginEvent extends AppEvent {
  late String mobileNumber;
  late String accessToken = "";
  late String isSdCode;
  late String source;

  LoginEvent(this.mobileNumber, this.accessToken, this.isSdCode, this.source);
}

class VerifyOtpEvent extends AppEvent {
  late String deviceType;
  late String deviceId = "";
  late String devicesToken;
  late String otp;

  VerifyOtpEvent(this.deviceType, this.deviceId, this.devicesToken, this.otp);
}





