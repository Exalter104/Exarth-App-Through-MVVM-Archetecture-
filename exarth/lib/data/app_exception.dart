class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return "$_message$_prefix";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error due to Internet");
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, "Invalid request To Server");
}

class UnAutherizedRequestException extends AppException {
  UnAutherizedRequestException([String? message])
      : super(message, "Unautherized Request Error");
}

class InvalidInputsException extends AppException {
  InvalidInputsException([String? message]) : super(message, "invalid Inputs");
}


//===> NEXT IS 
//==>enum and Api_response Class 