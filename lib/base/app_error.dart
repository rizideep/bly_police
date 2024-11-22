class AppError {
  late ErrorTypes errorType;
  late String errorMessage;
  late int statusCode;

  AppError(this.errorType, this.errorMessage,this.statusCode);

  setErrorType(ErrorTypes errorType) {
    this.errorType = errorType;
  }

  getErrorType() {
    return errorType;
  }


  setErrorMessage(String errorMessage) {
    this.errorMessage = errorMessage;
  }

  getErrorMessage() {
    return errorMessage;
  }

  setStatusMessage(int statusCode) {
    this.statusCode = statusCode;
  }

  getStatusMessage() {
    return statusCode;
  }
}

enum ErrorTypes { error, noContent, noInternet, show, token }
