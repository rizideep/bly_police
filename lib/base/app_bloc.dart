import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart';

import '../server_api/server_constant.dart';
import '../server_api/server_response.dart';
import '../utils/app_constant.dart';
import 'app_events.dart';
import 'app_repository.dart';
import 'app_states.dart';
import 'app_error.dart';



class AppBloc extends Bloc<AppEvent, AppStates> {
  final _loginRepository = AppRepository();

  AppBloc() : super(NeutralState()) {
    on<AppEvent>((event, emit) async {
      if (event is InitialEvent) {
        emit(NeutralState());
        return;
      }
      emit(LoadingState(event));
      Response response = await tigerEventsByTypes(event);
      if (response.statusCode == 200) {
        emitStateByServerResponseStatusCode(response, emit, event);
      } else if (response.statusCode == ServerConstant.networkStatus) {
        AppError noInterNetError = AppError(
            ErrorTypes.show, AppConstant.noInternet, response.statusCode);
        emit(NetworkErrorState(noInterNetError, event));
      } else if (response.statusCode == ServerConstant.slowNetworkStatus) {
        AppError errorState = AppError(
            ErrorTypes.error, AppConstant.slowInternet, response.statusCode);
        emit(ErrorState(errorState, event));
      } else {
        AppError errorState = AppError(ErrorTypes.error,
            AppConstant.responseNotFound, ServerConstant.apiCallError);
        emit(ErrorState(errorState, event));
      }
    });
  }

  tigerEventsByTypes(AppEvent event) async {
    if (event is LoginEvent) {
      return await _loginRepository.userLoginApi(event);
    }
    if (event is VerifyOtpEvent) {
      // return await _loginRepository.userVerifyOtpApi(event);
    }
  }

  void emitStateByServerResponseStatusCode(
      Response response, Emitter<AppStates> emit, AppEvent appEvent) {
    ServerResponse? serverResponse;
    try {
      serverResponse = ServerResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      AppError error = AppError(
          ErrorTypes.error, "Parsing Error", ServerConstant.errorStatus);
      emit(ErrorState(error, appEvent));
      return;
    }
    if (serverResponse.appStatusCode == ServerConstant.successStatus) {
      emit(SuccessState(serverResponse, appEvent));
    } else if (serverResponse.appStatusCode ==
        ServerConstant.tokenExpiredStatus) {
      AppError tokenError = AppError(ErrorTypes.error,
          AppConstant.yourTokenHaseExpired, serverResponse.appStatusCode);
      emit(ErrorState(tokenError, appEvent));
    } else if (serverResponse.appStatusCode ==
        ServerConstant.tokenBlockedStatus) {
      AppError tokenError = AppError(ErrorTypes.error, serverResponse.message,
          serverResponse.appStatusCode);
      emit(ErrorState(tokenError, appEvent));
    } else if (serverResponse.appStatusCode == ServerConstant.errorStatus) {
      AppError error = AppError(ErrorTypes.show, serverResponse.message,
          serverResponse.appStatusCode);
      emit(ErrorState(error, appEvent));
    } else {
      AppError error = AppError(ErrorTypes.error, serverResponse.message,
          serverResponse.appStatusCode);
      emit(ErrorState(error, appEvent));
    }
  }

 /* Future<Response?> updateUserTokenToServer(UpdateFcmTokenEvent event) async {
    return await _loginRepository.updateFcmToken(event);
  }*/
}
