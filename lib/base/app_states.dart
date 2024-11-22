import '../server_api/server_response.dart';
import 'app_events.dart';
import 'app_error.dart';

class AppStates {}


  class NeutralState extends AppStates {

}
class DataUiState extends AppStates {
}

class LoadingState extends AppStates {
  late bool isLoading;
  late AppEvent appEvent;
  LoadingState( this.appEvent);
}

class ErrorState extends AppStates {
  late AppError appError;
  late AppEvent appEvent;
  ErrorState(this.appError,this.appEvent);
}

class SessionState extends AppStates {
  late AppError appError;
  late AppEvent appEvent;
  SessionState(this.appError,this.appEvent);
}

class NetworkErrorState extends AppStates {
  late AppError appError;
  late AppEvent appEvent;
  NetworkErrorState(this.appError,this.appEvent);
}

class SuccessState extends AppStates {
  late ServerResponse serverResponse;
  late AppEvent appEvent;
  SuccessState(this.serverResponse,this.appEvent);
}

// class UploadDocSuccessState extends AppStates {
//   late ImageUploadResponseData serverResponse;
//   late AppEvent appEvent;
//   UploadDocSuccessState(this.serverResponse,this.appEvent);
// }
