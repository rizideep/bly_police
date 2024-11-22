

class ServerResponse<T> {
  final bool status;
  late final int appStatusCode;
  final String message;
  final T data;

  ServerResponse({
    required this.status,
    required this.appStatusCode,
    required this.message,
    required this.data,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    return ServerResponse(
      status: json['status'],
      appStatusCode: json['status_code'],
      message: json['message'],
      data: json['data'],
    );
  }
}
