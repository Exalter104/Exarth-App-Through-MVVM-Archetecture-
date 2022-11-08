import 'package:exarth/data/response/status.dart';

// how to handle the responses of a exception thats why we create response for exception
class ApiResponse<T> {
  // its Enum status
  Status? status;
  //dynamic function passes to get data
  T? data;
  String? message;
//constructor created
  ApiResponse(this.status, this.data, this.message);
// if status is completed then pick a complete status from enum
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  // if status is error then pick a errpr status from enum
  // if error occure then will go to exception class to handle any type of error that we defined
  ApiResponse.error(this.message) : status = Status.ERROR;
  // if status is loading then pick a loading status from enum
  ApiResponse.loading() : status = Status.LOADING;
// this is a ovverode methed to use again again get data from above methed
  @override
  String toString() {
    return "Status :$status \n Data :$data \n Message :$message";
  }
}


//===> NEXT is to Create get and Post Api Integration


//===> NEXT IS
//==>Network Folder base_api_services.dart