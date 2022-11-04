class AppExceptionError implements Exception {
  final _message;
  final _prefix;
  AppExceptionError([this._message, this._prefix]);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataExceptionError extends AppExceptionError {
  FetchDataExceptionError([String? message, String? prefix])
      : super(message, "Error During Message");
}

class BadRequestExceptionError extends AppExceptionError {
  BadRequestExceptionError([String? message, String? prefix])
      : super(message, "Invalid Request Error");
}

class UnautherizedExceptionError extends AppExceptionError {
  UnautherizedExceptionError([String? message, String? prefix])
      : super(message, "Unautherize Request Error");
}

class InvalidInputExceptionError extends AppExceptionError {
  InvalidInputExceptionError([String? message, String? prefix])
      : super(message, "Invalid Input Error");
}
